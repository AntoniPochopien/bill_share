import 'package:bill_share/auth/domain/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_member.freezed.dart';

@freezed
class GroupMember with _$GroupMember {
  const factory GroupMember({
    required User user,
    required bool isAdmin,
  }) = _GroupMember;
}
