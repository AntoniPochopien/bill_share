import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_member.freezed.dart';
part 'group_member.g.dart';

@freezed
class GroupMember with _$GroupMember {
  const GroupMember._();
  const factory GroupMember({
    required String id,
    required String username,
    @JsonKey(name: 'image_url') required String? imageUrl,
    @JsonKey(name: 'is_admin') @Default(false) bool isAdmin,
  }) = _GroupMember;

  factory GroupMember.fromJson(Map<String, dynamic> json) =>
      _$GroupMemberFromJson(json);
}
