// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SimpleGroup {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  int get membersCount => throw _privateConstructorUsedError;

  /// Create a copy of SimpleGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleGroupCopyWith<SimpleGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleGroupCopyWith<$Res> {
  factory $SimpleGroupCopyWith(
          SimpleGroup value, $Res Function(SimpleGroup) then) =
      _$SimpleGroupCopyWithImpl<$Res, SimpleGroup>;
  @useResult
  $Res call({int id, String name, bool isAdmin, int membersCount});
}

/// @nodoc
class _$SimpleGroupCopyWithImpl<$Res, $Val extends SimpleGroup>
    implements $SimpleGroupCopyWith<$Res> {
  _$SimpleGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isAdmin = null,
    Object? membersCount = null,
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
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      membersCount: null == membersCount
          ? _value.membersCount
          : membersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SimpleGroupImplCopyWith<$Res>
    implements $SimpleGroupCopyWith<$Res> {
  factory _$$SimpleGroupImplCopyWith(
          _$SimpleGroupImpl value, $Res Function(_$SimpleGroupImpl) then) =
      __$$SimpleGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, bool isAdmin, int membersCount});
}

/// @nodoc
class __$$SimpleGroupImplCopyWithImpl<$Res>
    extends _$SimpleGroupCopyWithImpl<$Res, _$SimpleGroupImpl>
    implements _$$SimpleGroupImplCopyWith<$Res> {
  __$$SimpleGroupImplCopyWithImpl(
      _$SimpleGroupImpl _value, $Res Function(_$SimpleGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimpleGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isAdmin = null,
    Object? membersCount = null,
  }) {
    return _then(_$SimpleGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      membersCount: null == membersCount
          ? _value.membersCount
          : membersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SimpleGroupImpl extends _SimpleGroup {
  const _$SimpleGroupImpl(
      {required this.id,
      required this.name,
      required this.isAdmin,
      required this.membersCount})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final bool isAdmin;
  @override
  final int membersCount;

  @override
  String toString() {
    return 'SimpleGroup(id: $id, name: $name, isAdmin: $isAdmin, membersCount: $membersCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.membersCount, membersCount) ||
                other.membersCount == membersCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, isAdmin, membersCount);

  /// Create a copy of SimpleGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleGroupImplCopyWith<_$SimpleGroupImpl> get copyWith =>
      __$$SimpleGroupImplCopyWithImpl<_$SimpleGroupImpl>(this, _$identity);
}

abstract class _SimpleGroup extends SimpleGroup {
  const factory _SimpleGroup(
      {required final int id,
      required final String name,
      required final bool isAdmin,
      required final int membersCount}) = _$SimpleGroupImpl;
  const _SimpleGroup._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  bool get isAdmin;
  @override
  int get membersCount;

  /// Create a copy of SimpleGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleGroupImplCopyWith<_$SimpleGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
