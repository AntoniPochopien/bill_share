import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_data.freezed.dart';

@freezed
class GroupData with _$GroupData {
  const factory GroupData({
    required List<GroupMember> members,
  }) = _GroupData;
}
