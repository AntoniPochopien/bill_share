// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_beneficiaries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpenseBeneficiaries {
  GroupMember get beneficiary => throw _privateConstructorUsedError;
  double get share => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseBeneficiaries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseBeneficiariesCopyWith<ExpenseBeneficiaries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseBeneficiariesCopyWith<$Res> {
  factory $ExpenseBeneficiariesCopyWith(ExpenseBeneficiaries value,
          $Res Function(ExpenseBeneficiaries) then) =
      _$ExpenseBeneficiariesCopyWithImpl<$Res, ExpenseBeneficiaries>;
  @useResult
  $Res call({GroupMember beneficiary, double share});

  $GroupMemberCopyWith<$Res> get beneficiary;
}

/// @nodoc
class _$ExpenseBeneficiariesCopyWithImpl<$Res,
        $Val extends ExpenseBeneficiaries>
    implements $ExpenseBeneficiariesCopyWith<$Res> {
  _$ExpenseBeneficiariesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseBeneficiaries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiary = null,
    Object? share = null,
  }) {
    return _then(_value.copyWith(
      beneficiary: null == beneficiary
          ? _value.beneficiary
          : beneficiary // ignore: cast_nullable_to_non_nullable
              as GroupMember,
      share: null == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of ExpenseBeneficiaries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupMemberCopyWith<$Res> get beneficiary {
    return $GroupMemberCopyWith<$Res>(_value.beneficiary, (value) {
      return _then(_value.copyWith(beneficiary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExpenseBeneficiariesImplCopyWith<$Res>
    implements $ExpenseBeneficiariesCopyWith<$Res> {
  factory _$$ExpenseBeneficiariesImplCopyWith(_$ExpenseBeneficiariesImpl value,
          $Res Function(_$ExpenseBeneficiariesImpl) then) =
      __$$ExpenseBeneficiariesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GroupMember beneficiary, double share});

  @override
  $GroupMemberCopyWith<$Res> get beneficiary;
}

/// @nodoc
class __$$ExpenseBeneficiariesImplCopyWithImpl<$Res>
    extends _$ExpenseBeneficiariesCopyWithImpl<$Res, _$ExpenseBeneficiariesImpl>
    implements _$$ExpenseBeneficiariesImplCopyWith<$Res> {
  __$$ExpenseBeneficiariesImplCopyWithImpl(_$ExpenseBeneficiariesImpl _value,
      $Res Function(_$ExpenseBeneficiariesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseBeneficiaries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiary = null,
    Object? share = null,
  }) {
    return _then(_$ExpenseBeneficiariesImpl(
      beneficiary: null == beneficiary
          ? _value.beneficiary
          : beneficiary // ignore: cast_nullable_to_non_nullable
              as GroupMember,
      share: null == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ExpenseBeneficiariesImpl implements _ExpenseBeneficiaries {
  const _$ExpenseBeneficiariesImpl(
      {required this.beneficiary, required this.share});

  @override
  final GroupMember beneficiary;
  @override
  final double share;

  @override
  String toString() {
    return 'ExpenseBeneficiaries(beneficiary: $beneficiary, share: $share)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseBeneficiariesImpl &&
            (identical(other.beneficiary, beneficiary) ||
                other.beneficiary == beneficiary) &&
            (identical(other.share, share) || other.share == share));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beneficiary, share);

  /// Create a copy of ExpenseBeneficiaries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseBeneficiariesImplCopyWith<_$ExpenseBeneficiariesImpl>
      get copyWith =>
          __$$ExpenseBeneficiariesImplCopyWithImpl<_$ExpenseBeneficiariesImpl>(
              this, _$identity);
}

abstract class _ExpenseBeneficiaries implements ExpenseBeneficiaries {
  const factory _ExpenseBeneficiaries(
      {required final GroupMember beneficiary,
      required final double share}) = _$ExpenseBeneficiariesImpl;

  @override
  GroupMember get beneficiary;
  @override
  double get share;

  /// Create a copy of ExpenseBeneficiaries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseBeneficiariesImplCopyWith<_$ExpenseBeneficiariesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
