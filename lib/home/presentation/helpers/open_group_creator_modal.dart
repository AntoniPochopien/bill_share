import 'package:bill_share/home/application/group_creator_cubit/group_creator_cubit.dart';
import 'package:bill_share/home/presentation/widgets/modals/create_group_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void openGroupCreatorModal(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: ContinuousRectangleBorder(),
      builder: (ctx) => CreateGroupModal(
            groupCreatorCubit: context.read<GroupCreatorCubit>(),
          ));
}
