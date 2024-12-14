import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/group_members_screen/presentation/widgets/member_tile.dart';
import 'package:bill_share/group_navigator/application/cubit/group_cubit.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GroupMembersScreen extends StatelessWidget {
  const GroupMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupCubit, GroupState>(
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () => SizedBox(),
            data: (groupData) => BillshareScaffold(
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleWithUnderscore(
                          title: T(context).members,
                          padding: EdgeInsets.only(bottom: 8),
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: groupData.members.length,
                                itemBuilder: (context, index) => MemberTile(
                                    groupMember: groupData.members[index]))),
                      ]),
                ));
      },
    );
  }
}
