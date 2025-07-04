// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AppStartupScreen]
class AppStartupRoute extends PageRouteInfo<void> {
  const AppStartupRoute({List<PageRouteInfo>? children})
      : super(
          AppStartupRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppStartupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppStartupScreen();
    },
  );
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthScreen();
    },
  );
}

/// generated route for
/// [ConfirmEmailScreen]
class ConfirmEmailRoute extends PageRouteInfo<void> {
  const ConfirmEmailRoute({List<PageRouteInfo>? children})
      : super(
          ConfirmEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmEmailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ConfirmEmailScreen();
    },
  );
}

/// generated route for
/// [ExpenseCreatorScreen]
class ExpenseCreatorRoute extends PageRouteInfo<ExpenseCreatorRouteArgs> {
  ExpenseCreatorRoute({
    Key? key,
    required List<GroupMember> groupMembers,
    required int groupId,
    List<PageRouteInfo>? children,
  }) : super(
          ExpenseCreatorRoute.name,
          args: ExpenseCreatorRouteArgs(
            key: key,
            groupMembers: groupMembers,
            groupId: groupId,
          ),
          initialChildren: children,
        );

  static const String name = 'ExpenseCreatorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExpenseCreatorRouteArgs>();
      return ExpenseCreatorScreen(
        key: args.key,
        groupMembers: args.groupMembers,
        groupId: args.groupId,
      );
    },
  );
}

class ExpenseCreatorRouteArgs {
  const ExpenseCreatorRouteArgs({
    this.key,
    required this.groupMembers,
    required this.groupId,
  });

  final Key? key;

  final List<GroupMember> groupMembers;

  final int groupId;

  @override
  String toString() {
    return 'ExpenseCreatorRouteArgs{key: $key, groupMembers: $groupMembers, groupId: $groupId}';
  }
}

/// generated route for
/// [GroupChatScreen]
class GroupChatRoute extends PageRouteInfo<void> {
  const GroupChatRoute({List<PageRouteInfo>? children})
      : super(
          GroupChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'GroupChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GroupChatScreen();
    },
  );
}

/// generated route for
/// [GroupDashboardScreen]
class GroupDashboardRoute extends PageRouteInfo<void> {
  const GroupDashboardRoute({List<PageRouteInfo>? children})
      : super(
          GroupDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'GroupDashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GroupDashboardScreen();
    },
  );
}

/// generated route for
/// [GroupMembersScreen]
class GroupMembersRoute extends PageRouteInfo<void> {
  const GroupMembersRoute({List<PageRouteInfo>? children})
      : super(
          GroupMembersRoute.name,
          initialChildren: children,
        );

  static const String name = 'GroupMembersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GroupMembersScreen();
    },
  );
}

/// generated route for
/// [GroupNavigatorScreen]
class GroupNavigatorRoute extends PageRouteInfo<GroupNavigatorRouteArgs> {
  GroupNavigatorRoute({
    Key? key,
    required int groupId,
    List<PageRouteInfo>? children,
  }) : super(
          GroupNavigatorRoute.name,
          args: GroupNavigatorRouteArgs(
            key: key,
            groupId: groupId,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupNavigatorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GroupNavigatorRouteArgs>();
      return GroupNavigatorScreen(
        key: args.key,
        groupId: args.groupId,
      );
    },
  );
}

class GroupNavigatorRouteArgs {
  const GroupNavigatorRouteArgs({
    this.key,
    required this.groupId,
  });

  final Key? key;

  final int groupId;

  @override
  String toString() {
    return 'GroupNavigatorRouteArgs{key: $key, groupId: $groupId}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}
