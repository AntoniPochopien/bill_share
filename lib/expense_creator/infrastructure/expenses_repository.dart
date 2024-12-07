import 'dart:convert';
import 'dart:developer';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/expense_creator/domain/expense_creator_model.dart';
import 'package:bill_share/expense_creator/domain/i_expenses_repository.dart';
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
}
