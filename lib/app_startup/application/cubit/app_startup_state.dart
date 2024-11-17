part of 'app_startup_cubit.dart';

@freezed
class AppStartupState with _$AppStartupState {
  const factory AppStartupState.initial() = _Initial;
  const factory AppStartupState.authenticated(User user) = _Authenticated;
  const factory AppStartupState.unauthenticated() = _Unauthenticated;
}
