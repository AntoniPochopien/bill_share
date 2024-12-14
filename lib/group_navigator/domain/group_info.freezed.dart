// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GroupInfo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get accessCode => throw _privateConstructorUsedError;
  bool get locked => throw _privateConstructorUsedError;

  /// Create a copy of GroupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupInfoCopyWith<GroupInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupInfoCopyWith<$Res> {
  factory $GroupInfoCopyWith(GroupInfo value, $Res Function(GroupInfo) then) =
      _$GroupInfoCopyWithImpl<$Res, GroupInfo>;
  @useResult
  $Res call({int id, String name, String accessCode, bool locked});
}

/// @nodoc
class _$GroupInfoCopyWithImpl<$Res, $Val extends GroupInfo>
    implements $GroupInfoCopyWith<$Res> {
  _$GroupInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? accessCode = null,
    Object? locked = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accessCode: null == accessCode
          ? _value.accessCode
          : accessCode // ignore: cast_nullable_to_non_nullable
              as String,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupInfoImplCopyWith<$Res>
    implements $GroupInfoCopyWith<$Res> {
  factory _$$GroupInfoImplCopyWith(
          _$GroupInfoImpl value, $Res Function(_$GroupInfoImpl) then) =
      __$$GroupInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String accessCode, bool locked});
}

/// @nodoc
class __$$GroupInfoImplCopyWithImpl<$Res>
    extends _$GroupInfoCopyWithImpl<$Res, _$GroupInfoImpl>
    implements _$$GroupInfoImplCopyWith<$Res> {
  __$$GroupInfoImplCopyWithImpl(
      _$GroupInfoImpl _value, $Res Function(_$GroupInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? accessCode = null,
    Object? locked = null,
  }) {
    return _then(_$GroupInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accessCode: null == accessCode
          ? _value.accessCode
          : accessCode // ignore: cast_nullable_to_non_nullable
              as String,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GroupInfoImpl implements _GroupInfo {
  const _$GroupInfoImpl(
      {required this.id,
      required this.name,
      required this.accessCode,
      required this.locked});

  @override
  final int id;
  @override
  final String name;
  @override
  final String accessCode;
  @override
  final bool locked;

  @override
  String toString() {
    return 'GroupInfo(id: $id, name: $name, accessCode: $accessCode, locked: $locked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accessCode, accessCode) ||
                other.accessCode == accessCode) &&
            (identical(other.locked, locked) || other.locked == locked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, accessCode, locked);

  /// Create a copy of GroupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupInfoImplCopyWith<_$GroupInfoImpl> get copyWith =>
      __$$GroupInfoImplCopyWithImpl<_$GroupInfoImpl>(this, _$identity);
}

abstract class _GroupInfo implements GroupInfo {
  const factory _GroupInfo(
      {required final int id,
      required final String name,
      required final String accessCode,
      required final bool locked}) = _$GroupInfoImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get accessCode;
  @override
  bool get locked;

  /// Create a copy of GroupInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupInfoImplCopyWith<_$GroupInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
