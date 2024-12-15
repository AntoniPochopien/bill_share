// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_group_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JoinGroupState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SimpleGroup newGroup) joined,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(SimpleGroup newGroup)? joined,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SimpleGroup newGroup)? joined,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Joined value) joined,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Joined value)? joined,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Joined value)? joined,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinGroupStateCopyWith<$Res> {
  factory $JoinGroupStateCopyWith(
          JoinGroupState value, $Res Function(JoinGroupState) then) =
      _$JoinGroupStateCopyWithImpl<$Res, JoinGroupState>;
}

/// @nodoc
class _$JoinGroupStateCopyWithImpl<$Res, $Val extends JoinGroupState>
    implements $JoinGroupStateCopyWith<$Res> {
  _$JoinGroupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JoinGroupState
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
    extends _$JoinGroupStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of JoinGroupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'JoinGroupState.initial()';
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
    required TResult Function(SimpleGroup newGroup) joined,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(SimpleGroup newGroup)? joined,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SimpleGroup newGroup)? joined,
    TResult Function()? loading,
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
    required TResult Function(_Joined value) joined,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Joined value)? joined,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Joined value)? joined,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements JoinGroupState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$JoinedImplCopyWith<$Res> {
  factory _$$JoinedImplCopyWith(
          _$JoinedImpl value, $Res Function(_$JoinedImpl) then) =
      __$$JoinedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SimpleGroup newGroup});

  $SimpleGroupCopyWith<$Res> get newGroup;
}

/// @nodoc
class __$$JoinedImplCopyWithImpl<$Res>
    extends _$JoinGroupStateCopyWithImpl<$Res, _$JoinedImpl>
    implements _$$JoinedImplCopyWith<$Res> {
  __$$JoinedImplCopyWithImpl(
      _$JoinedImpl _value, $Res Function(_$JoinedImpl) _then)
      : super(_value, _then);

  /// Create a copy of JoinGroupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newGroup = null,
  }) {
    return _then(_$JoinedImpl(
      null == newGroup
          ? _value.newGroup
          : newGroup // ignore: cast_nullable_to_non_nullable
              as SimpleGroup,
    ));
  }

  /// Create a copy of JoinGroupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleGroupCopyWith<$Res> get newGroup {
    return $SimpleGroupCopyWith<$Res>(_value.newGroup, (value) {
      return _then(_value.copyWith(newGroup: value));
    });
  }
}

/// @nodoc

class _$JoinedImpl implements _Joined {
  const _$JoinedImpl(this.newGroup);

  @override
  final SimpleGroup newGroup;

  @override
  String toString() {
    return 'JoinGroupState.joined(newGroup: $newGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinedImpl &&
            (identical(other.newGroup, newGroup) ||
                other.newGroup == newGroup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newGroup);

  /// Create a copy of JoinGroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinedImplCopyWith<_$JoinedImpl> get copyWith =>
      __$$JoinedImplCopyWithImpl<_$JoinedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SimpleGroup newGroup) joined,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) {
    return joined(newGroup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(SimpleGroup newGroup)? joined,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) {
    return joined?.call(newGroup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SimpleGroup newGroup)? joined,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (joined != null) {
      return joined(newGroup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Joined value) joined,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) error,
  }) {
    return joined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Joined value)? joined,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? error,
  }) {
    return joined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Joined value)? joined,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? error,
    required TResult orElse(),
  }) {
    if (joined != null) {
      return joined(this);
    }
    return orElse();
  }
}

abstract class _Joined implements JoinGroupState {
  const factory _Joined(final SimpleGroup newGroup) = _$JoinedImpl;

  SimpleGroup get newGroup;

  /// Create a copy of JoinGroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinedImplCopyWith<_$JoinedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$JoinGroupStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of JoinGroupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'JoinGroupState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SimpleGroup newGroup) joined,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(SimpleGroup newGroup)? joined,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SimpleGroup newGroup)? joined,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Joined value) joined,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Joined value)? joined,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Joined value)? joined,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements JoinGroupState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$JoinGroupStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of JoinGroupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$FailureImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  /// Create a copy of JoinGroupState
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

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'JoinGroupState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of JoinGroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SimpleGroup newGroup) joined,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(SimpleGroup newGroup)? joined,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SimpleGroup newGroup)? joined,
    TResult Function()? loading,
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
    required TResult Function(_Joined value) joined,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Joined value)? joined,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Joined value)? joined,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Failure implements JoinGroupState {
  const factory _Failure(final Failure failure) = _$FailureImpl;

  Failure get failure;

  /// Create a copy of JoinGroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
