import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/expense_creator/domain/expense_creator_model.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense_event.dart';
import 'package:dartz/dartz.dart';

abstract class IExpensesRepository {
  Future<Either<Failure, List<Expense>>> fetchGroupExpenses(int groupId);
  Either<Failure, Stream<ExpenseEvent>> observeExpenses(int groupId);
  Future<Either<Failure, Unit>> saveExpense(ExpenseCreatorModel expense);
}
