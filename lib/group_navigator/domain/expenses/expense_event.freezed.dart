// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpenseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Expense expense) insert,
    required TResult Function(Expense expense) update,
    required TResult Function(int id) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Expense expense)? insert,
    TResult? Function(Expense expense)? update,
    TResult? Function(int id)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Expense expense)? insert,
    TResult Function(Expense expense)? update,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Insert value) insert,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Insert value)? insert,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Insert value)? insert,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseEventCopyWith<$Res> {
  factory $ExpenseEventCopyWith(
          ExpenseEvent value, $Res Function(ExpenseEvent) then) =
      _$ExpenseEventCopyWithImpl<$Res, ExpenseEvent>;
}

/// @nodoc
class _$ExpenseEventCopyWithImpl<$Res, $Val extends ExpenseEvent>
    implements $ExpenseEventCopyWith<$Res> {
  _$ExpenseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InsertImplCopyWith<$Res> {
  factory _$$InsertImplCopyWith(
          _$InsertImpl value, $Res Function(_$InsertImpl) then) =
      __$$InsertImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Expense expense});

  $ExpenseCopyWith<$Res> get expense;
}

/// @nodoc
class __$$InsertImplCopyWithImpl<$Res>
    extends _$ExpenseEventCopyWithImpl<$Res, _$InsertImpl>
    implements _$$InsertImplCopyWith<$Res> {
  __$$InsertImplCopyWithImpl(
      _$InsertImpl _value, $Res Function(_$InsertImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expense = null,
  }) {
    return _then(_$InsertImpl(
      null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as Expense,
    ));
  }

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseCopyWith<$Res> get expense {
    return $ExpenseCopyWith<$Res>(_value.expense, (value) {
      return _then(_value.copyWith(expense: value));
    });
  }
}

/// @nodoc

class _$InsertImpl implements _Insert {
  const _$InsertImpl(this.expense);

  @override
  final Expense expense;

  @override
  String toString() {
    return 'ExpenseEvent.insert(expense: $expense)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsertImpl &&
            (identical(other.expense, expense) || other.expense == expense));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expense);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InsertImplCopyWith<_$InsertImpl> get copyWith =>
      __$$InsertImplCopyWithImpl<_$InsertImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Expense expense) insert,
    required TResult Function(Expense expense) update,
    required TResult Function(int id) delete,
  }) {
    return insert(expense);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Expense expense)? insert,
    TResult? Function(Expense expense)? update,
    TResult? Function(int id)? delete,
  }) {
    return insert?.call(expense);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Expense expense)? insert,
    TResult Function(Expense expense)? update,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (insert != null) {
      return insert(expense);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Insert value) insert,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
  }) {
    return insert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Insert value)? insert,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
  }) {
    return insert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Insert value)? insert,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (insert != null) {
      return insert(this);
    }
    return orElse();
  }
}

abstract class _Insert implements ExpenseEvent {
  const factory _Insert(final Expense expense) = _$InsertImpl;

  Expense get expense;

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InsertImplCopyWith<_$InsertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Expense expense});

  $ExpenseCopyWith<$Res> get expense;
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$ExpenseEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expense = null,
  }) {
    return _then(_$UpdateImpl(
      null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as Expense,
    ));
  }

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseCopyWith<$Res> get expense {
    return $ExpenseCopyWith<$Res>(_value.expense, (value) {
      return _then(_value.copyWith(expense: value));
    });
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.expense);

  @override
  final Expense expense;

  @override
  String toString() {
    return 'ExpenseEvent.update(expense: $expense)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.expense, expense) || other.expense == expense));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expense);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Expense expense) insert,
    required TResult Function(Expense expense) update,
    required TResult Function(int id) delete,
  }) {
    return update(expense);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Expense expense)? insert,
    TResult? Function(Expense expense)? update,
    TResult? Function(int id)? delete,
  }) {
    return update?.call(expense);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Expense expense)? insert,
    TResult Function(Expense expense)? update,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(expense);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Insert value) insert,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Insert value)? insert,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Insert value)? insert,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements ExpenseEvent {
  const factory _Update(final Expense expense) = _$UpdateImpl;

  Expense get expense;

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$ExpenseEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ExpenseEvent.delete(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Expense expense) insert,
    required TResult Function(Expense expense) update,
    required TResult Function(int id) delete,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Expense expense)? insert,
    TResult? Function(Expense expense)? update,
    TResult? Function(int id)? delete,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Expense expense)? insert,
    TResult Function(Expense expense)? update,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Insert value) insert,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Insert value)? insert,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Insert value)? insert,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements ExpenseEvent {
  const factory _Delete(final int id) = _$DeleteImpl;

  int get id;

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
