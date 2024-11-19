part of 'groups_cubit.dart';

@freezed
class GroupsState with _$GroupsState {
  const factory GroupsState.loading() = _loading;
  const factory GroupsState.data() = _Initial;
  const factory GroupsState.error() = _Error;
}
