import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/group_navigator/domain/group_data.dart';
import 'package:bill_share/group_navigator/domain/i_group_repository.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_state.dart';
part 'group_cubit.freezed.dart';

class GroupCubit extends Cubit<GroupState> {
  final ILocalStorageRepository iLocalStorageRepository;
  final IGroupRepository iGroupRepository;
  GroupCubit({
    required this.iLocalStorageRepository,
    required this.iGroupRepository,
  }) : super(GroupState.initial());

  void init(int groupId) async {
    await iLocalStorageRepository.saveLastGroupId(groupId);
    final result = await iGroupRepository.fetchGroupMembers(groupId);
    result.fold(
      (l) => emit(GroupState.error(l)),
      (r) => emit(GroupState.data(groupData: GroupData(members: r))),
    );
  }
}
