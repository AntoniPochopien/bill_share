import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_creator_model.freezed.dart';

@freezed
class ExpenseCreatorModel with _$ExpenseCreatorModel {
  const factory ExpenseCreatorModel({
    required String title,
    required double amount,
    required GroupMember payer,
    required List<GroupMember> beneficients,
  }) = _ExpenseCreatorModel;
}
