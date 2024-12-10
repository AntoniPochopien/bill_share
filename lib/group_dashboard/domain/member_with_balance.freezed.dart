// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_with_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemberWithBalance {
  GroupMember get groupMember => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  /// Create a copy of MemberWithBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberWithBalanceCopyWith<MemberWithBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberWithBalanceCopyWith<$Res> {
  factory $MemberWithBalanceCopyWith(
          MemberWithBalance value, $Res Function(MemberWithBalance) then) =
      _$MemberWithBalanceCopyWithImpl<$Res, MemberWithBalance>;
  @useResult
  $Res call({GroupMember groupMember, double value});

  $GroupMemberCopyWith<$Res> get groupMember;
}

/// @nodoc
class _$MemberWithBalanceCopyWithImpl<$Res, $Val extends MemberWithBalance>
    implements $MemberWithBalanceCopyWith<$Res> {
  _$MemberWithBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberWithBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupMember = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      groupMember: null == groupMember
          ? _value.groupMember
          : groupMember // ignore: cast_nullable_to_non_nullable
              as GroupMember,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of MemberWithBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupMemberCopyWith<$Res> get groupMember {
    return $GroupMemberCopyWith<$Res>(_value.groupMember, (value) {
      return _then(_value.copyWith(groupMember: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemberWithBalanceImplCopyWith<$Res>
    implements $MemberWithBalanceCopyWith<$Res> {
  factory _$$MemberWithBalanceImplCopyWith(_$MemberWithBalanceImpl value,
          $Res Function(_$MemberWithBalanceImpl) then) =
      __$$MemberWithBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GroupMember groupMember, double value});

  @override
  $GroupMemberCopyWith<$Res> get groupMember;
}

/// @nodoc
class __$$MemberWithBalanceImplCopyWithImpl<$Res>
    extends _$MemberWithBalanceCopyWithImpl<$Res, _$MemberWithBalanceImpl>
    implements _$$MemberWithBalanceImplCopyWith<$Res> {
  __$$MemberWithBalanceImplCopyWithImpl(_$MemberWithBalanceImpl _value,
      $Res Function(_$MemberWithBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberWithBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupMember = null,
    Object? value = null,
  }) {
    return _then(_$MemberWithBalanceImpl(
      groupMember: null == groupMember
          ? _value.groupMember
          : groupMember // ignore: cast_nullable_to_non_nullable
              as GroupMember,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MemberWithBalanceImpl extends _MemberWithBalance {
  const _$MemberWithBalanceImpl(
      {required this.groupMember, required this.value})
      : super._();

  @override
  final GroupMember groupMember;
  @override
  final double value;

  @override
  String toString() {
    return 'MemberWithBalance(groupMember: $groupMember, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberWithBalanceImpl &&
            (identical(other.groupMember, groupMember) ||
                other.groupMember == groupMember) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupMember, value);

  /// Create a copy of MemberWithBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberWithBalanceImplCopyWith<_$MemberWithBalanceImpl> get copyWith =>
      __$$MemberWithBalanceImplCopyWithImpl<_$MemberWithBalanceImpl>(
          this, _$identity);
}

abstract class _MemberWithBalance extends MemberWithBalance {
  const factory _MemberWithBalance(
      {required final GroupMember groupMember,
      required final double value}) = _$MemberWithBalanceImpl;
  const _MemberWithBalance._() : super._();

  @override
  GroupMember get groupMember;
  @override
  double get value;

  /// Create a copy of MemberWithBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberWithBalanceImplCopyWith<_$MemberWithBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
