import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/expense_creator/domain/expense_creator_model.dart';
import 'package:bill_share/expense_creator/domain/i_expenses_repository.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense_beneficiaries.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense_event.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExpensesRepository implements IExpensesRepository {
  final _supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, Unit>> saveExpense(ExpenseCreatorModel expense) async {
    try {
      final beneficientsIds = expense.beneficients.map((e) => e.id).toList();
      final body = {
        'group_id': expense.groupId,
        'title': expense.title,
        'amount': expense.amount,
        'payer_id': expense.payer.id,
        'beneficients_ids': beneficientsIds
      };
      final response = await _supabase.functions
          .invoke('create-expense', body: jsonEncode(body));
      if (response.status == 201) {
        return right(unit);
      }
      return left(Failure.unexpected());
    } catch (e) {
      log('createExpense unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Either<Failure, Stream<ExpenseEvent>> observeExpenses(int groupId) {
    try {
      final streamController = StreamController<ExpenseEvent>.broadcast();
      _supabase
          .channel('public:expenses')
          .onPostgresChanges(
              event: PostgresChangeEvent.all,
              schema: 'public',
              table: 'expenses',
              filter: PostgresChangeFilter(
                type: PostgresChangeFilterType.eq,
                column: 'group_id',
                value: groupId,
              ),
              callback: (payload) async {
                if (payload.eventType == PostgresChangeEvent.insert) {
                  final newRecord = payload.newRecord;
                  log('expenses observer event: INSERT');
                  final event =
                      await _onInsertOrUpdate(newRecord, update: false);
                  streamController.add(event);
                } else if (payload.eventType == PostgresChangeEvent.delete) {
                  log('expenses observer event: DELETE');
                  final oldRecord = payload.oldRecord;
                  final event = ExpenseEvent.delete(oldRecord['id']);
                  streamController.add(event);
                } else if (payload.eventType == PostgresChangeEvent.update) {
                  final newRecord = payload.newRecord;
                  log('expenses observer event: UPDATE');
                  final event =
                      await _onInsertOrUpdate(newRecord, update: true);
                  streamController.add(event);
                }
              })
          .subscribe();
      return right(streamController.stream);
    } catch (e) {
      log('observeExpenses unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  Future<ExpenseEvent> _onInsertOrUpdate(Map<String, dynamic> newRecord,
      {required bool update}) async {
    final expenseId = newRecord['id'];
    final responses = await Future.wait([
      _supabase
          .from('expense_beneficiaries')
          .select('profiles(id, username, image_url), share')
          .eq('expense_id', expenseId),
      _supabase.from('expenses').select('''
              creator:profiles!expenses_creator_id_fkey(id, username, image_url),
              payer:profiles!expenses_payer_id_fkey(id, username, image_url)
              ''').eq('id', expenseId)
    ]);
    final beneficiariesResponse = responses[0];
    final expenseResponse = responses[1];

    final expenseBeneficiaries = beneficiariesResponse.map((e) {
      final profiles = e['profiles'];
      return ExpenseBeneficiaries(
          beneficiary: GroupMember.fromJson(profiles),
          share: e['share'].toDouble());
    }).toList();

    final expense = expenseResponse[0];
    final payerProfile = expense['payer'];
    final payer = GroupMember.fromJson(payerProfile);
    final creatorProfile = expense['creator'];
    final creator = GroupMember.fromJson(creatorProfile);

    final newExpense = Expense(
      id: expenseId,
      title: newRecord['title'],
      groupId: newRecord['group_id'],
      amount: newRecord['amount'].toDouble(),
      beneficiaries: expenseBeneficiaries,
      payer: payer,
      creator: creator,
      createdAt: DateTime.parse(newRecord['created_at']),
    );
    return update
        ? ExpenseEvent.update(newExpense)
        : ExpenseEvent.insert(newExpense);
  }

  @override
  Future<Either<Failure, List<Expense>>> fetchGroupExpenses(int groupId) async {
    try {
      final expenseResponse = await _supabase
          .from('expenses')
          .select('''
              id, 
              group_id, 
              amount, 
              created_at, 
              title, 
              creator:profiles!expenses_creator_id_fkey(id, username, image_url), 
              payer:profiles!expenses_payer_id_fkey(id, username, image_url)
              ''')
          .eq('group_id', groupId)
          .order('created_at', ascending: false)
          .range(0, 10);

      final expenses = await Future.wait(expenseResponse.map((e) async {
        final beneficiariesResponse = await _supabase
            .from('expense_beneficiaries')
            .select('profiles(id, username, image_url), share')
            .eq('expense_id', e['id']);

        final payerData = e['payer'];
        final payer = GroupMember.fromJson(payerData);

        final creatorData = e['creator'];
        final creator = GroupMember.fromJson(creatorData);

        final beneficiaries = beneficiariesResponse.map((element) {
          final profiles = element['profiles'];
          return ExpenseBeneficiaries(
              beneficiary: GroupMember.fromJson(profiles),
              share: element['share'].toDouble());
        }).toList();
        return Expense(
          id: e['id'],
          title: e['title'],
          groupId: e['group_id'],
          amount: e['amount'].toDouble(),
          createdAt: DateTime.parse(e['created_at']),
          beneficiaries: beneficiaries,
          payer: payer,
          creator: creator,
        );
      }));
      return right(expenses);
    } catch (e) {
      log('fetchGroupExpenses unexpected error: $e');
      return left(Failure.unexpected());
    }
  }
}
