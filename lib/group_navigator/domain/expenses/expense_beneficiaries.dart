import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_beneficiaries.freezed.dart';

@freezed
class ExpenseBeneficiaries with _$ExpenseBeneficiaries {
  const factory ExpenseBeneficiaries({
    required GroupMember beneficiary,
    required double share,
  }) =_ExpenseBeneficiaries;
}