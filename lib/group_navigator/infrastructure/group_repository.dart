import 'dart:async';
import 'dart:developer';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense_beneficiaries.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense_event.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:bill_share/group_navigator/domain/i_group_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupRepository implements IGroupRepository {
  final _supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, List<GroupMember>>> fetchGroupMembers(
      int groupId) async {
    try {
      final response = await _supabase
          .from('groups_profiles')
          .select('profiles(id, username), isAdmin')
          .eq('group_id', groupId);
      final members = response.map((e) => GroupMember.fromJson(e)).toList();
      return right(members);
    } catch (e) {
      log('fetchGroupMembers unexpected error: $e');
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
              callback: (payload) async {
                if (payload.eventType == PostgresChangeEvent.insert) {
                  final newRecord = payload.newRecord;
                  if (newRecord['group_id'] == groupId) {
                    final event = await _onInsertOrUpdate(newRecord);
                    streamController.add(event);
                  }
                } else if (payload.eventType == PostgresChangeEvent.delete) {
                  final oldRecord = payload.oldRecord;
                  final event = ExpenseEvent.delete(oldRecord['id']);
                  streamController.add(event);
                } else if (payload.eventType == PostgresChangeEvent.update) {
                  final newRecord = payload.newRecord;
                  if (newRecord['group_id'] == groupId) {
                    final event = await _onInsertOrUpdate(newRecord);
                    streamController.add(event);
                  }
                }
              })
          .subscribe();
      return right(streamController.stream);
    } catch (e) {
      log('observeExpenses unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  Future<ExpenseEvent> _onInsertOrUpdate(Map<String, dynamic> newRecord) async {
    final expenseId = newRecord['id'];
    final responses = await Future.wait([
      _supabase
          .from('expense_beneficiaries')
          .select('profiles(id, username), share')
          .eq('expense_id', expenseId),
      _supabase
          .from('expenses')
          .select('profiles(id, username), group_id')
          .eq('id', expenseId)
    ]);
    final beneficiariesResponse = responses[0];
    final payerResponse = responses[1];

    final expenseBeneficiaries = beneficiariesResponse.map((e) {
      final profiles = e['profiles'];
      return ExpenseBeneficiaries(
          beneficiary: GroupMember(
              id: profiles['id'],
              username: profiles['username'],
              isAdmin: false),
          share: e['share'].toDouble());
    }).toList();

    final payer = GroupMember(
        id: payerResponse[0]['id'],
        username: payerResponse[0]['username'],
        isAdmin: false);

    final newExpense = Expense(
      id: expenseId,
      groupId: payerResponse[0]['group_id'],
      amount: newRecord['amount'],
      beneficiaries: expenseBeneficiaries,
      payer: payer,
    );
    return ExpenseEvent.insert(newExpense);
  }

  @override
  Future<Either<Failure, List<Expense>>> fetchGroupExpenses(int groupId) async {
    try {
      final expenseResponse = await _supabase
          .from('expenses')
          .select('id, profiles(id, username), group_id, amount')
          .eq('group_id', groupId)
          .range(0, 10);

      final expenses = await Future.wait(expenseResponse.map((e) async {
        final beneficiariesResponse = await _supabase
            .from('expense_beneficiaries')
            .select('profiles(id, username), share')
            .eq('expense_id', e['id']);
        log(e.toString());

        final payerData = e['profiles'];
        final payer = GroupMember(
            id: payerData['id'],
            username: payerData['username'],
            isAdmin: false);

        final beneficiaries = beneficiariesResponse.map((element) {
          final profiles = element['profiles'];
          return ExpenseBeneficiaries(
              beneficiary: GroupMember(
                  id: profiles['id'],
                  username: profiles['username'],
                  isAdmin: false),
              share: element['share'].toDouble());
        }).toList();

        return Expense(
          id: e['id'],
          groupId: e['group_id'],
          amount: e['amount'].toDouble(),
          beneficiaries: beneficiaries,
          payer: payer,
        );
      }));
      return right(expenses);
    } catch (e) {
      log('fetchGroupExpenses unexpected error: $e');
      return left(Failure.unexpected());
    }
  }
}
