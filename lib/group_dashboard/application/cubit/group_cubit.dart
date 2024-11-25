import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_state.dart';
part 'group_cubit.freezed.dart';

class GroupCubit extends Cubit<GroupState> {
  final ILocalStorageRepository iLocalStorageRepository;
  GroupCubit({
    required this.iLocalStorageRepository,
  }) : super(GroupState.initial());

  void init(int groupId) async {
    await iLocalStorageRepository.saveLastGroupId(groupId);
  }
}
