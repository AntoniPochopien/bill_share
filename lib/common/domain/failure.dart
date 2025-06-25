import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.cannotReach() = _CannotReach;
  const factory Failure.unauthorized() = _Unauthorized;
  const factory Failure.wrongCredentials() = _WrongCredentials;
  const factory Failure.groupNotExists() = _GroupNotExists;
  const factory Failure.dontBelongToGroup() = _DontBelongToGroup;
  const factory Failure.userAlreadyExists() = _UserAlreadyExists;
  const factory Failure.emailNotConfirmed() = _EmailNotConfirmed;
  const factory Failure.unexpected([@Default('unexpected') String? message]) =
      _Unexpected;
}