import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/group_navigator/application/cubit/group_cubit.dart';
import 'package:bill_share/group_navigator/presentation/widgets/dashboard_drawer.dart';
import 'package:bill_share/group_navigator/presentation/widgets/group_appbar.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupNavPage extends StatefulWidget {
  const GroupNavPage({super.key});

  @override
  State<GroupNavPage> createState() => _GroupNavPageState();
}

class _GroupNavPageState extends State<GroupNavPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: [
          GroupMembersRoute(),
          GroupDashboardRoute(),
          GroupChatRoute(),
        ],
        homeIndex: 2,
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return BlocBuilder<GroupCubit, GroupState>(
              builder: (context, state) => state.maybeWhen(
                  orElse: () => SizedBox(),
                  data: (groupData) => BillshareScaffold(
                        scaffoldKey: _scaffoldKey,
                        endDrawer: DashboardDrawer(
                          groupData: groupData,
                          isAdmin: groupData.members.any(
                            (element) =>
                                element.id ==
                                    getIt<InjectableUser>().currentUser.id &&
                                element.isAdmin,
                          ),
                        ),
                        appBar: GroupAppbar(
                          groupInfo: groupData.groupInfo,
                          onGroupTap: () =>
                              _scaffoldKey.currentState?.openEndDrawer(),
                        ),
                        padding: EdgeInsets.zero,
                        body: child,
                        floatingActionButton: FloatingActionButton(
                            backgroundColor: AppColors.green,
                            foregroundColor: AppColors.white,
                            onPressed: () {
                              context.pushRoute(ExpenseCreatorRoute(
                                groupId: groupData.groupInfo.id,
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
