import 'package:bill_share/group_navigator/domain/expenses/expense_beneficiaries.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    required int id,
    required int groupId,
    required String title,
    required GroupMember payer,
    required double amount,
    required DateTime createdAt,
    required List<ExpenseBeneficiaries> beneficiaries,
  }) = _Expense;
}
