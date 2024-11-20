import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/home/domain/simple_group.dart';
import 'package:bill_share/home/presentation/helpers/open_group_creator_modal.dart';
import 'package:bill_share/home/presentation/widgets/group_tile.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class GroupsListView extends StatelessWidget {
  final List<SimpleGroup> groups;
  const GroupsListView({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TitleWithUnderscore(title: 'Your groups'),
      ),
      Expanded(
        child: ListView.builder(
            itemCount: groups.length,
            itemBuilder: (context, index) => GroupTile(
                  group: groups[index],
                  onTap: () => context.pushRoute(
                      GroupDashboardRoute(groupId: groups[index].id)),
                )),
      ),
      Button(text: '+', onPressed: () => openGroupCreatorModal(context)),
    ]);
  }
}
