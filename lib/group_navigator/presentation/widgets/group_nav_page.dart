import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/group_navigator/application/cubit/group_cubit.dart';
import 'package:bill_share/group_navigator/presentation/widgets/group_appbar.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupNavPage extends StatelessWidget {
  const GroupNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: [
          GroupMembersRoute(),
          GroupDashboardRoute(),
          GroupChatRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return BlocBuilder<GroupCubit, GroupState>(
              builder: (context, state) => state.maybeWhen(
                  orElse: () => SizedBox(),
                  data: (groupData) => BillshareScaffold(
                        appBar: GroupAppbar(groupInfo: groupData.groupInfo),
                        padding: EdgeInsets.zero,
                        body: child,
                        floatingActionButton: FloatingActionButton(
                            backgroundColor: AppColors.green,
                            foregroundColor: AppColors.white,
                            onPressed: () {
                              context.pushRoute(ExpenseCreatorRoute(
                                groupId: groupData.id,
                                groupMembers: groupData.members,
                              ));
                            },
                            child: Icon(Icons.add)),
                        bottomNavigationBar: BottomNavigationBar(
                            currentIndex: tabsRouter.activeIndex,
                            selectedItemColor: AppColors.green,
                            onTap: (value) => tabsRouter.setActiveIndex(value),
                            items: [
                              BottomNavigationBarItem(
                                icon: Icon(Icons.person),
                                label: T(context).members,
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.data_usage_outlined),
                                label: 'Dashboard',
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.chat_bubble),
                                label: 'Chat',
                              )
                            ]),
                      )));
        });
  }
}
