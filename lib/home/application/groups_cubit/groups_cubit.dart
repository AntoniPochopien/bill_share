import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/home/domain/i_groups_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'groups_state.dart';
part 'groups_cubit.freezed.dart';

class GroupsCubit extends Cubit<GroupsState> {
  final InjectableUser injectableUser;
  final IGroupsRepository iGroupsRepository;
  GroupsCubit({
    required this.iGroupsRepository,
    required this.injectableUser,
  }) : super(GroupsState.loading());

  void fetchUserGroups() {
    emit(GroupsState.loading());
    iGroupsRepository.fetchUserGroups(injectableUser.currentUser.id);
  }
}
