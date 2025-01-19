// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupMemberImpl _$$GroupMemberImplFromJson(Map<String, dynamic> json) =>
    _$GroupMemberImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      imageUrl: json['image_url'] as String?,
      isAdmin: json['is_admin'] as bool? ?? false,
    );

Map<String, dynamic> _$$GroupMemberImplToJson(_$GroupMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image_url': instance.imageUrl,
      'is_admin': instance.isAdmin,
    };
