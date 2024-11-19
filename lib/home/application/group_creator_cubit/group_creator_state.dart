part of 'group_creator_cubit.dart';

@freezed
class GroupCreatorState with _$GroupCreatorState {
  const factory GroupCreatorState.initial() = _Initial;
  const factory GroupCreatorState.created(int id) = _Created;
  const factory GroupCreatorState.loading() = _Loading;
  const factory GroupCreatorState.error(Failure failure) = _Error;
}
