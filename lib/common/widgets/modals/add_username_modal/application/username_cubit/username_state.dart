part of 'username_cubit.dart';

@freezed
class UsernameState with _$UsernameState {
  const factory UsernameState.initial() = _Initial;
  const factory UsernameState.added() = _added;
  const factory UsernameState.loading() = _Loading;
  const factory UsernameState.error(Failure failure) = _Error;

}
