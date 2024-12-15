part of 'join_group_cubit.dart';

@freezed
class JoinGroupState with _$JoinGroupState {
  const factory JoinGroupState.initial() = _Initial;
  const factory JoinGroupState.joined(SimpleGroup newGroup) = _Joined;
  const factory JoinGroupState.loading() = _Loading;
  const factory JoinGroupState.error(Failure failure) = _Failure;
}
