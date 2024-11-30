import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/widgets/app_bars/app_bar_with_actions.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';

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
        return BillshareScaffold(
          appBar: AppBarWithActions(),
          padding: EdgeInsets.zero,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              selectedItemColor: AppColors.green,
              onTap: (value) => tabsRouter.setActiveIndex(value),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Members',
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
        );
      },
    );
  }
}
