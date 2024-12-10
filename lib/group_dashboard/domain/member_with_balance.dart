import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_with_balance.freezed.dart';

@freezed
class MemberWithBalance with _$MemberWithBalance {
  const MemberWithBalance._();
  const factory MemberWithBalance({
    required GroupMember groupMember,
    required double value,
  }) = _MemberWithBalance;

  static MemberWithBalance fromJson(Map<String, dynamic> data) =>
      MemberWithBalance(
          groupMember: GroupMember.fromJson(data), value: data['balance'].toDouble());
}
