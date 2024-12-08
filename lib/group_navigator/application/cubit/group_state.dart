part of 'group_cubit.dart';

@freezed
class GroupState with _$GroupState {
  const factory GroupState.initial() = _Initial;
  const factory GroupState.data({
    required GroupData groupData,
  }) = _Data;
  const factory GroupState.loading() = _Loading;
  const factory GroupState.error(Failure failure) = _Error;
}
