part of 'app_startup_cubit.dart';

@freezed
class AppStartupState with _$AppStartupState {
  const factory AppStartupState.initial() = _Initial;
  const factory AppStartupState.navigateToGroup(int groupId) = _NavigateToGroup;
  const factory AppStartupState.navigateToHome() = _NavigateToHome;
}
