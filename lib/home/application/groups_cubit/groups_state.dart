part of 'groups_cubit.dart';

@freezed
class GroupsState with _$GroupsState {
  const factory GroupsState.loading() = _loading;
  const factory GroupsState.groups(List<SimpleGroup> groups) = _Groups;
  const factory GroupsState.error(Failure failure) = _Error;
}
