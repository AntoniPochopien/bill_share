// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardData {
  double get toPay => throw _privateConstructorUsedError;
  double get toRecive => throw _privateConstructorUsedError;
  List<MemberWithBalance> get membersWithBalance =>
      throw _privateConstructorUsedError;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
          DashboardData value, $Res Function(DashboardData) then) =
      _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call(
      {double toPay,
      double toRecive,
      List<MemberWithBalance> membersWithBalance});
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toPay = null,
    Object? toRecive = null,
    Object? membersWithBalance = null,
  }) {
    return _then(_value.copyWith(
      toPay: null == toPay
          ? _value.toPay
          : toPay // ignore: cast_nullable_to_non_nullable
              as double,
      toRecive: null == toRecive
          ? _value.toRecive
          : toRecive // ignore: cast_nullable_to_non_nullable
              as double,
      membersWithBalance: null == membersWithBalance
          ? _value.membersWithBalance
          : membersWithBalance // ignore: cast_nullable_to_non_nullable
              as List<MemberWithBalance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
          _$DashboardDataImpl value, $Res Function(_$DashboardDataImpl) then) =
      __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double toPay,
      double toRecive,
      List<MemberWithBalance> membersWithBalance});
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
      _$DashboardDataImpl _value, $Res Function(_$DashboardDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toPay = null,
    Object? toRecive = null,
    Object? membersWithBalance = null,
  }) {
    return _then(_$DashboardDataImpl(
      toPay: null == toPay
          ? _value.toPay
          : toPay // ignore: cast_nullable_to_non_nullable
              as double,
      toRecive: null == toRecive
          ? _value.toRecive
          : toRecive // ignore: cast_nullable_to_non_nullable
              as double,
      membersWithBalance: null == membersWithBalance
          ? _value._membersWithBalance
          : membersWithBalance // ignore: cast_nullable_to_non_nullable
              as List<MemberWithBalance>,
    ));
  }
}

/// @nodoc

class _$DashboardDataImpl implements _DashboardData {
  const _$DashboardDataImpl(
      {required this.toPay,
      required this.toRecive,
      required final List<MemberWithBalance> membersWithBalance})
      : _membersWithBalance = membersWithBalance;

  @override
  final double toPay;
  @override
  final double toRecive;
  final List<MemberWithBalance> _membersWithBalance;
  @override
  List<MemberWithBalance> get membersWithBalance {
    if (_membersWithBalance is EqualUnmodifiableListView)
      return _membersWithBalance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_membersWithBalance);
  }

  @override
  String toString() {
    return 'DashboardData(toPay: $toPay, toRecive: $toRecive, membersWithBalance: $membersWithBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            (identical(other.toPay, toPay) || other.toPay == toPay) &&
            (identical(other.toRecive, toRecive) ||
                other.toRecive == toRecive) &&
            const DeepCollectionEquality()
                .equals(other._membersWithBalance, _membersWithBalance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toPay, toRecive,
      const DeepCollectionEquality().hash(_membersWithBalance));

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);
}

abstract class _DashboardData implements DashboardData {
  const factory _DashboardData(
          {required final double toPay,
          required final double toRecive,
          required final List<MemberWithBalance> membersWithBalance}) =
      _$DashboardDataImpl;

  @override
  double get toPay;
  @override
  double get toRecive;
  @override
  List<MemberWithBalance> get membersWithBalance;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
