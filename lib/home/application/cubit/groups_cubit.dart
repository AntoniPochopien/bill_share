import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'groups_state.dart';
part 'groups_cubit.freezed.dart';

class GroupsCubit extends Cubit<GroupsState> {
  GroupsCubit() : super(GroupsState.loading());
}
