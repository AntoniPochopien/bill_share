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
