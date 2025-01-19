import 'package:auto_route/auto_route.dart';
import 'package:bill_share/app_startup/presentation/app_startup_screen.dart';
import 'package:bill_share/auth/presentation/auth_screen.dart';
import 'package:bill_share/expense_creator/presentation/expense_creator_screen.dart';
import 'package:bill_share/group_chat/presentation/group_chat_screen.dart';
import 'package:bill_share/group_dashboard/presentation/group_dashboard_screen.dart';
import 'package:bill_share/group_members_screen/presentation/group_members_screen.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:bill_share/group_navigator/presentation/group_navigator_screen.dart';
import 'package:bill_share/home/presentation/home_screen.dart';
import 'package:bill_share/settings/presentation/settings_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppStartupRoute.page, initial: true),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ExpenseCreatorRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: GroupNavigatorRoute.page, children: [
          AutoRoute(page: GroupMembersRoute.page),
          AutoRoute(page: GroupDashboardRoute.page, initial: true),
          AutoRoute(page: GroupChatRoute.page),
        ]),
      ];
}
