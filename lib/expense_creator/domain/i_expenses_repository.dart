import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/expense_creator/domain/expense_creator_model.dart';
import 'package:dartz/dartz.dart';

abstract class IExpensesRepository {
  Future<Either<Failure, Unit>> saveExpense(ExpenseCreatorModel expense);
}