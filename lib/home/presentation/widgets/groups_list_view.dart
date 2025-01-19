import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/home/application/join_group_cubit/join_group_cubit.dart';
import 'package:bill_share/home/domain/simple_group.dart';
import 'package:bill_share/home/presentation/helpers/open_group_creator_modal.dart';
import 'package:bill_share/home/presentation/widgets/group_tile.dart';
import 'package:bill_share/home/presentation/widgets/modals/choose_action_modal.dart';
import 'package:bill_share/home/presentation/widgets/modals/join_group_modal.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsListView extends StatelessWidget {
  final List<SimpleGroup> groups;
  const GroupsListView({super.key, required this.groups});

  void _openModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: ContinuousRectangleBorder(),
        builder: (ctx) => ChooseActionModal(
              onCreate: () => openGroupCreatorModal(context),
              onJoin: () => showModalBottomSheet(
                  context: context,
                  shape: ContinuousRectangleBorder(),
                  builder: (ctx) => JoinGroupModal(
                        joinGroupCubit: context.read<JoinGroupCubit>(),
                      )),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TitleWithUnderscore(title: T(context).your_groups),
      Expanded(
        child: ListView.builder(
            itemCount: groups.length,
            itemBuilder: (context, index) => GroupTile(
                  group: groups[index],
                  onTap: () => context.pushRoute(
                      GroupNavigatorRoute(groupId: groups[index].id)),
                )),
      ),
      Button(text: '+', onPressed: () => _openModal(context)),
    ]);
  }
}
