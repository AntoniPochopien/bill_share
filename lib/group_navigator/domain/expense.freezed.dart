// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Expense {
  int get id => throw _privateConstructorUsedError;
  int get groupId => throw _privateConstructorUsedError;
  GroupMember get payer => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  List<ExpenseBeneficiaries> get beneficiaries =>
      throw _privateConstructorUsedError;

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseCopyWith<Expense> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) then) =
      _$ExpenseCopyWithImpl<$Res, Expense>;
  @useResult
  $Res call(
      {int id,
      int groupId,
      GroupMember payer,
      double amount,
      List<ExpenseBeneficiaries> beneficiaries});

  $GroupMemberCopyWith<$Res> get payer;
}

/// @nodoc
class _$ExpenseCopyWithImpl<$Res, $Val extends Expense>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? payer = null,
    Object? amount = null,
    Object? beneficiaries = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      payer: null == payer
          ? _value.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as GroupMember,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      beneficiaries: null == beneficiaries
          ? _value.beneficiaries
          : beneficiaries // ignore: cast_nullable_to_non_nullable
              as List<ExpenseBeneficiaries>,
    ) as $Val);
  }

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupMemberCopyWith<$Res> get payer {
    return $GroupMemberCopyWith<$Res>(_value.payer, (value) {
      return _then(_value.copyWith(payer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExpenseImplCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$$ExpenseImplCopyWith(
          _$ExpenseImpl value, $Res Function(_$ExpenseImpl) then) =
      __$$ExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int groupId,
      GroupMember payer,
      double amount,
      List<ExpenseBeneficiaries> beneficiaries});

  @override
  $GroupMemberCopyWith<$Res> get payer;
}

/// @nodoc
class __$$ExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseCopyWithImpl<$Res, _$ExpenseImpl>
    implements _$$ExpenseImplCopyWith<$Res> {
  __$$ExpenseImplCopyWithImpl(
      _$ExpenseImpl _value, $Res Function(_$ExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? payer = null,
    Object? amount = null,
    Object? beneficiaries = null,
  }) {
    return _then(_$ExpenseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      payer: null == payer
          ? _value.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as GroupMember,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      beneficiaries: null == beneficiaries
          ? _value._beneficiaries
          : beneficiaries // ignore: cast_nullable_to_non_nullable
              as List<ExpenseBeneficiaries>,
    ));
  }
}

/// @nodoc

class _$ExpenseImpl implements _Expense {
  const _$ExpenseImpl(
      {required this.id,
      required this.groupId,
      required this.payer,
      required this.amount,
      required final List<ExpenseBeneficiaries> beneficiaries})
      : _beneficiaries = beneficiaries;

  @override
  final int id;
  @override
  final int groupId;
  @override
  final GroupMember payer;
  @override
  final double amount;
  final List<ExpenseBeneficiaries> _beneficiaries;
  @override
  List<ExpenseBeneficiaries> get beneficiaries {
    if (_beneficiaries is EqualUnmodifiableListView) return _beneficiaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beneficiaries);
  }

  @override
  String toString() {
    return 'Expense(id: $id, groupId: $groupId, payer: $payer, amount: $amount, beneficiaries: $beneficiaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.payer, payer) || other.payer == payer) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality()
                .equals(other._beneficiaries, _beneficiaries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, groupId, payer, amount,
      const DeepCollectionEquality().hash(_beneficiaries));

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseImplCopyWith<_$ExpenseImpl> get copyWith =>
      __$$ExpenseImplCopyWithImpl<_$ExpenseImpl>(this, _$identity);
}

abstract class _Expense implements Expense {
  const factory _Expense(
      {required final int id,
      required final int groupId,
      required final GroupMember payer,
      required final double amount,
      required final List<ExpenseBeneficiaries> beneficiaries}) = _$ExpenseImpl;

  @override
  int get id;
  @override
  int get groupId;
  @override
  GroupMember get payer;
  @override
  double get amount;
  @override
  List<ExpenseBeneficiaries> get beneficiaries;

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseImplCopyWith<_$ExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
