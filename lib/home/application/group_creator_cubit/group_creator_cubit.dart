import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/home/domain/i_groups_repository.dart';
import 'package:bill_share/home/domain/simple_group.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_creator_state.dart';
part 'group_creator_cubit.freezed.dart';

class GroupCreatorCubit extends Cubit<GroupCreatorState> {
  final IGroupsRepository iGroupsRepository;
  GroupCreatorCubit({
    required this.iGroupsRepository,
  }) : super(GroupCreatorState.initial());

  void createGroup(String groupName) async {
    emit(GroupCreatorState.loading());
    final result = await iGroupsRepository.createGroup(groupName);
    result.fold(
      (l) => emit(GroupCreatorState.error(l)),
      (r) => emit(GroupCreatorState.created(r)),
    );
  }
}
