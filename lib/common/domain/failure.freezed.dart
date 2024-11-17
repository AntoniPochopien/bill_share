// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cannotReach,
    required TResult Function() unauthorized,
    required TResult Function() wrongCredentials,
    required TResult Function(String? message) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cannotReach,
    TResult? Function()? unauthorized,
    TResult? Function()? wrongCredentials,
    TResult? Function(String? message)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cannotReach,
    TResult Function()? unauthorized,
    TResult Function()? wrongCredentials,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CannotReach value) cannotReach,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_WrongCredentials value) wrongCredentials,
    required TResult Function(_Unexpected value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CannotReach value)? cannotReach,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_WrongCredentials value)? wrongCredentials,
    TResult? Function(_Unexpected value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CannotReach value)? cannotReach,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CannotReachImplCopyWith<$Res> {
  factory _$$CannotReachImplCopyWith(
          _$CannotReachImpl value, $Res Function(_$CannotReachImpl) then) =
      __$$CannotReachImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CannotReachImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CannotReachImpl>
    implements _$$CannotReachImplCopyWith<$Res> {
  __$$CannotReachImplCopyWithImpl(
      _$CannotReachImpl _value, $Res Function(_$CannotReachImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CannotReachImpl implements _CannotReach {
  const _$CannotReachImpl();

  @override
  String toString() {
    return 'Failure.cannotReach()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CannotReachImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cannotReach,
    required TResult Function() unauthorized,
    required TResult Function() wrongCredentials,
    required TResult Function(String? message) unexpected,
  }) {
    return cannotReach();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cannotReach,
    TResult? Function()? unauthorized,
    TResult? Function()? wrongCredentials,
    TResult? Function(String? message)? unexpected,
  }) {
    return cannotReach?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cannotReach,
    TResult Function()? unauthorized,
    TResult Function()? wrongCredentials,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) {
    if (cannotReach != null) {
      return cannotReach();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CannotReach value) cannotReach,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_WrongCredentials value) wrongCredentials,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return cannotReach(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CannotReach value)? cannotReach,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_WrongCredentials value)? wrongCredentials,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return cannotReach?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CannotReach value)? cannotReach,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (cannotReach != null) {
      return cannotReach(this);
    }
    return orElse();
  }
}

abstract class _CannotReach implements Failure {
  const factory _CannotReach() = _$CannotReachImpl;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
          _$UnauthorizedImpl value, $Res Function(_$UnauthorizedImpl) then) =
      __$$UnauthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl _value, $Res Function(_$UnauthorizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthorizedImpl implements _Unauthorized {
  const _$UnauthorizedImpl();

  @override
  String toString() {
    return 'Failure.unauthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cannotReach,
    required TResult Function() unauthorized,
    required TResult Function() wrongCredentials,
    required TResult Function(String? message) unexpected,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cannotReach,
    TResult? Function()? unauthorized,
    TResult? Function()? wrongCredentials,
    TResult? Function(String? message)? unexpected,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cannotReach,
    TResult Function()? unauthorized,
    TResult Function()? wrongCredentials,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CannotReach value) cannotReach,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_WrongCredentials value) wrongCredentials,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CannotReach value)? cannotReach,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_WrongCredentials value)? wrongCredentials,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CannotReach value)? cannotReach,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements Failure {
  const factory _Unauthorized() = _$UnauthorizedImpl;
}

/// @nodoc
abstract class _$$WrongCredentialsImplCopyWith<$Res> {
  factory _$$WrongCredentialsImplCopyWith(_$WrongCredentialsImpl value,
          $Res Function(_$WrongCredentialsImpl) then) =
      __$$WrongCredentialsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongCredentialsImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$WrongCredentialsImpl>
    implements _$$WrongCredentialsImplCopyWith<$Res> {
  __$$WrongCredentialsImplCopyWithImpl(_$WrongCredentialsImpl _value,
      $Res Function(_$WrongCredentialsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WrongCredentialsImpl implements _WrongCredentials {
  const _$WrongCredentialsImpl();

  @override
  String toString() {
    return 'Failure.wrongCredentials()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WrongCredentialsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cannotReach,
    required TResult Function() unauthorized,
    required TResult Function() wrongCredentials,
    required TResult Function(String? message) unexpected,
  }) {
    return wrongCredentials();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cannotReach,
    TResult? Function()? unauthorized,
    TResult? Function()? wrongCredentials,
    TResult? Function(String? message)? unexpected,
  }) {
    return wrongCredentials?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cannotReach,
    TResult Function()? unauthorized,
    TResult Function()? wrongCredentials,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) {
    if (wrongCredentials != null) {
      return wrongCredentials();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CannotReach value) cannotReach,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_WrongCredentials value) wrongCredentials,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return wrongCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CannotReach value)? cannotReach,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_WrongCredentials value)? wrongCredentials,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return wrongCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CannotReach value)? cannotReach,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (wrongCredentials != null) {
      return wrongCredentials(this);
    }
    return orElse();
  }
}

abstract class _WrongCredentials implements Failure {
  const factory _WrongCredentials() = _$WrongCredentialsImpl;
}

/// @nodoc
abstract class _$$UnexpectedImplCopyWith<$Res> {
  factory _$$UnexpectedImplCopyWith(
          _$UnexpectedImpl value, $Res Function(_$UnexpectedImpl) then) =
      __$$UnexpectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnexpectedImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnexpectedImpl>
    implements _$$UnexpectedImplCopyWith<$Res> {
  __$$UnexpectedImplCopyWithImpl(
      _$UnexpectedImpl _value, $Res Function(_$UnexpectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnexpectedImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnexpectedImpl implements _Unexpected {
  const _$UnexpectedImpl([this.message = 'unexpected']);

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'Failure.unexpected(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedImplCopyWith<_$UnexpectedImpl> get copyWith =>
      __$$UnexpectedImplCopyWithImpl<_$UnexpectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cannotReach,
    required TResult Function() unauthorized,
    required TResult Function() wrongCredentials,
    required TResult Function(String? message) unexpected,
  }) {
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cannotReach,
    TResult? Function()? unauthorized,
    TResult? Function()? wrongCredentials,
    TResult? Function(String? message)? unexpected,
  }) {
    return unexpected?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cannotReach,
    TResult Function()? unauthorized,
    TResult Function()? wrongCredentials,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CannotReach value) cannotReach,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_WrongCredentials value) wrongCredentials,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CannotReach value)? cannotReach,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_WrongCredentials value)? wrongCredentials,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CannotReach value)? cannotReach,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements Failure {
  const factory _Unexpected([final String? message]) = _$UnexpectedImpl;

  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedImplCopyWith<_$UnexpectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
