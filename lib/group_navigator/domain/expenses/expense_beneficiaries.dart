import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_beneficiaries.freezed.dart';
part 'expense_beneficiaries.g.dart';

@freezed
class ExpenseBeneficiaries with _$ExpenseBeneficiaries {
  const factory ExpenseBeneficiaries({
    required GroupMember beneficiary,
    required double share,
  }) =_ExpenseBeneficiaries;

  factory ExpenseBeneficiaries.fromJson(Map<String, dynamic> json) =>
      _$ExpenseBeneficiariesFromJson(json);
}