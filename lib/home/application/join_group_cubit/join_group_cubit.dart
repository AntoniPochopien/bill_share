import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/home/domain/i_groups_repository.dart';
import 'package:bill_share/home/domain/simple_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'join_group_state.dart';
part 'join_group_cubit.freezed.dart';

class JoinGroupCubit extends Cubit<JoinGroupState> {
  final IGroupsRepository iGroupRepository;
  JoinGroupCubit({
    required this.iGroupRepository,
  }) : super(JoinGroupState.initial());

  void joinGroup(String accessCode) async {
    emit(JoinGroupState.loading());
    final result = await iGroupRepository.joinGroup(accessCode);
    result.fold(
      (l) => emit(JoinGroupState.error(l)),
      (r) => emit(JoinGroupState.joined(r)),
    );
  }
}
