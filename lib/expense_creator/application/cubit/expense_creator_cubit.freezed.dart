// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_creator_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpenseCreatorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)
        initialized,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)?
        initialized,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)?
        initialized,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCreatorStateCopyWith<$Res> {
  factory $ExpenseCreatorStateCopyWith(
          ExpenseCreatorState value, $Res Function(ExpenseCreatorState) then) =
      _$ExpenseCreatorStateCopyWithImpl<$Res, ExpenseCreatorState>;
}

/// @nodoc
class _$ExpenseCreatorStateCopyWithImpl<$Res, $Val extends ExpenseCreatorState>
    implements $ExpenseCreatorStateCopyWith<$Res> {
  _$ExpenseCreatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseCreatorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ExpenseCreatorStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseCreatorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ExpenseCreatorState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)
        initialized,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)?
        initialized,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)?
        initialized,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ExpenseCreatorState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool isLoading,
      List<GroupMember> beneficiers,
      List<GroupMember> groupMembers,
      int groupId,
      GroupMember payer,
      bool beneficiersIsEmptyError,
      bool created});

  $GroupMemberCopyWith<$Res> get payer;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ExpenseCreatorStateCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseCreatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? beneficiers = null,
    Object? groupMembers = null,
    Object? groupId = null,
    Object? payer = null,
    Object? beneficiersIsEmptyError = null,
    Object? created = null,
  }) {
    return _then(_$InitializedImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      beneficiers: null == beneficiers
          ? _value._beneficiers
          : beneficiers // ignore: cast_nullable_to_non_nullable
              as List<GroupMember>,
      groupMembers: null == groupMembers
          ? _value._groupMembers
          : groupMembers // ignore: cast_nullable_to_non_nullable
              as List<GroupMember>,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      payer: null == payer
          ? _value.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as GroupMember,
      beneficiersIsEmptyError: null == beneficiersIsEmptyError
          ? _value.beneficiersIsEmptyError
          : beneficiersIsEmptyError // ignore: cast_nullable_to_non_nullable
              as bool,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ExpenseCreatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupMemberCopyWith<$Res> get payer {
    return $GroupMemberCopyWith<$Res>(_value.payer, (value) {
      return _then(_value.copyWith(payer: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {this.isLoading = false,
      final List<GroupMember> beneficiers = const [],
      final List<GroupMember> groupMembers = const [],
      required this.groupId,
      required this.payer,
      this.beneficiersIsEmptyError = false,
      this.created = false})
      : _beneficiers = beneficiers,
        _groupMembers = groupMembers;

  @override
  @JsonKey()
  final bool isLoading;
  final List<GroupMember> _beneficiers;
  @override
  @JsonKey()
  List<GroupMember> get beneficiers {
    if (_beneficiers is EqualUnmodifiableListView) return _beneficiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beneficiers);
  }

  final List<GroupMember> _groupMembers;
  @override
  @JsonKey()
  List<GroupMember> get groupMembers {
    if (_groupMembers is EqualUnmodifiableListView) return _groupMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupMembers);
  }

  @override
  final int groupId;
  @override
  final GroupMember payer;
  @override
  @JsonKey()
  final bool beneficiersIsEmptyError;
  @override
  @JsonKey()
  final bool created;

  @override
  String toString() {
    return 'ExpenseCreatorState.initialized(isLoading: $isLoading, beneficiers: $beneficiers, groupMembers: $groupMembers, groupId: $groupId, payer: $payer, beneficiersIsEmptyError: $beneficiersIsEmptyError, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._beneficiers, _beneficiers) &&
            const DeepCollectionEquality()
                .equals(other._groupMembers, _groupMembers) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.payer, payer) || other.payer == payer) &&
            (identical(
                    other.beneficiersIsEmptyError, beneficiersIsEmptyError) ||
                other.beneficiersIsEmptyError == beneficiersIsEmptyError) &&
            (identical(other.created, created) || other.created == created));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_beneficiers),
      const DeepCollectionEquality().hash(_groupMembers),
      groupId,
      payer,
      beneficiersIsEmptyError,
      created);

  /// Create a copy of ExpenseCreatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)
        initialized,
    required TResult Function(Failure failure) error,
  }) {
    return initialized(isLoading, beneficiers, groupMembers, groupId, payer,
        beneficiersIsEmptyError, created);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)?
        initialized,
    TResult? Function(Failure failure)? error,
  }) {
    return initialized?.call(isLoading, beneficiers, groupMembers, groupId,
        payer, beneficiersIsEmptyError, created);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)?
        initialized,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(isLoading, beneficiers, groupMembers, groupId, payer,
          beneficiersIsEmptyError, created);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Error value) error,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Error value)? error,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ExpenseCreatorState {
  const factory _Initialized(
      {final bool isLoading,
      final List<GroupMember> beneficiers,
      final List<GroupMember> groupMembers,
      required final int groupId,
      required final GroupMember payer,
      final bool beneficiersIsEmptyError,
      final bool created}) = _$InitializedImpl;

  bool get isLoading;
  List<GroupMember> get beneficiers;
  List<GroupMember> get groupMembers;
  int get groupId;
  GroupMember get payer;
  bool get beneficiersIsEmptyError;
  bool get created;

  /// Create a copy of ExpenseCreatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ExpenseCreatorStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseCreatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ErrorImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  /// Create a copy of ExpenseCreatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ExpenseCreatorState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of ExpenseCreatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)
        initialized,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)?
        initialized,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isLoading,
            List<GroupMember> beneficiers,
            List<GroupMember> groupMembers,
            int groupId,
            GroupMember payer,
            bool beneficiersIsEmptyError,
            bool created)?
        initialized,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ExpenseCreatorState {
  const factory _Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;

  /// Create a copy of ExpenseCreatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
