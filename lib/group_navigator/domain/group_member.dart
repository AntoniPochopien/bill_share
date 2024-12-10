import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_member.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class GroupMember with _$GroupMember {
  const GroupMember._();
  const factory GroupMember({
    required String id,
    required String username,
    required bool isAdmin,
  }) = _GroupMember;

  static GroupMember fromJson(Map<String, dynamic> data) {
    final profiles = data['profiles'];
    return GroupMember(
      id: profiles['id'],
      username: profiles['username'],
      isAdmin: data['is_admin'],
    );
  }
}
