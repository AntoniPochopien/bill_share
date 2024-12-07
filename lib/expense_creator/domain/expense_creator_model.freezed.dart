// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_creator_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpenseCreatorModel {
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  GroupMember get payer => throw _privateConstructorUsedError;
  List<GroupMember> get beneficients => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseCreatorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseCreatorModelCopyWith<ExpenseCreatorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCreatorModelCopyWith<$Res> {
  factory $ExpenseCreatorModelCopyWith(
          ExpenseCreatorModel value, $Res Function(ExpenseCreatorModel) then) =
      _$ExpenseCreatorModelCopyWithImpl<$Res, ExpenseCreatorModel>;
  @useResult
  $Res call(
      {String title,
      double amount,
      GroupMember payer,
      List<GroupMember> beneficients});

  $GroupMemberCopyWith<$Res> get payer;
}

/// @nodoc
class _$ExpenseCreatorModelCopyWithImpl<$Res, $Val extends ExpenseCreatorModel>
    implements $ExpenseCreatorModelCopyWith<$Res> {
  _$ExpenseCreatorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseCreatorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? amount = null,
    Object? payer = null,
    Object? beneficients = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      payer: null == payer
          ? _value.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as GroupMember,
      beneficients: null == beneficients
          ? _value.beneficients
          : beneficients // ignore: cast_nullable_to_non_nullable
              as List<GroupMember>,
    ) as $Val);
  }

  /// Create a copy of ExpenseCreatorModel
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
abstract class _$$ExpenseCreatorModelImplCopyWith<$Res>
    implements $ExpenseCreatorModelCopyWith<$Res> {
  factory _$$ExpenseCreatorModelImplCopyWith(_$ExpenseCreatorModelImpl value,
          $Res Function(_$ExpenseCreatorModelImpl) then) =
      __$$ExpenseCreatorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      double amount,
      GroupMember payer,
      List<GroupMember> beneficients});

  @override
  $GroupMemberCopyWith<$Res> get payer;
}

/// @nodoc
class __$$ExpenseCreatorModelImplCopyWithImpl<$Res>
    extends _$ExpenseCreatorModelCopyWithImpl<$Res, _$ExpenseCreatorModelImpl>
    implements _$$ExpenseCreatorModelImplCopyWith<$Res> {
  __$$ExpenseCreatorModelImplCopyWithImpl(_$ExpenseCreatorModelImpl _value,
      $Res Function(_$ExpenseCreatorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseCreatorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? amount = null,
    Object? payer = null,
    Object? beneficients = null,
  }) {
    return _then(_$ExpenseCreatorModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      payer: null == payer
          ? _value.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as GroupMember,
      beneficients: null == beneficients
          ? _value._beneficients
          : beneficients // ignore: cast_nullable_to_non_nullable
              as List<GroupMember>,
    ));
  }
}

/// @nodoc

class _$ExpenseCreatorModelImpl implements _ExpenseCreatorModel {
  const _$ExpenseCreatorModelImpl(
      {required this.title,
      required this.amount,
      required this.payer,
      required final List<GroupMember> beneficients})
      : _beneficients = beneficients;

  @override
  final String title;
  @override
  final double amount;
  @override
  final GroupMember payer;
  final List<GroupMember> _beneficients;
  @override
  List<GroupMember> get beneficients {
    if (_beneficients is EqualUnmodifiableListView) return _beneficients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beneficients);
  }

  @override
  String toString() {
    return 'ExpenseCreatorModel(title: $title, amount: $amount, payer: $payer, beneficients: $beneficients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseCreatorModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.payer, payer) || other.payer == payer) &&
            const DeepCollectionEquality()
                .equals(other._beneficients, _beneficients));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, amount, payer,
      const DeepCollectionEquality().hash(_beneficients));

  /// Create a copy of ExpenseCreatorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseCreatorModelImplCopyWith<_$ExpenseCreatorModelImpl> get copyWith =>
      __$$ExpenseCreatorModelImplCopyWithImpl<_$ExpenseCreatorModelImpl>(
          this, _$identity);
}

abstract class _ExpenseCreatorModel implements ExpenseCreatorModel {
  const factory _ExpenseCreatorModel(
          {required final String title,
          required final double amount,
          required final GroupMember payer,
          required final List<GroupMember> beneficients}) =
      _$ExpenseCreatorModelImpl;

  @override
  String get title;
  @override
  double get amount;
  @override
  GroupMember get payer;
  @override
  List<GroupMember> get beneficients;

  /// Create a copy of ExpenseCreatorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseCreatorModelImplCopyWith<_$ExpenseCreatorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
