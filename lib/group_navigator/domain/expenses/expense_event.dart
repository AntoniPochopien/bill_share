import 'package:bill_share/group_navigator/domain/expenses/expense.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_event.freezed.dart';

@freezed
class ExpenseEvent with _$ExpenseEvent {
  const factory ExpenseEvent.insert(Expense expense) =_Insert;
  const factory ExpenseEvent.update(Expense expense) =_Update;
  const factory ExpenseEvent.delete(int id) =_Delete;
}