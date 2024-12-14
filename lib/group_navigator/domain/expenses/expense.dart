import 'package:bill_share/group_navigator/domain/expenses/expense_beneficiaries.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    required int id,
    @JsonKey(name: 'group_id') required int groupId,
    required String title,
    required GroupMember payer,
    required GroupMember creator,
    required double amount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required List<ExpenseBeneficiaries> beneficiaries,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}
