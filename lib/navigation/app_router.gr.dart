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
/// [GroupDashboardScreen]
class GroupDashboardRoute extends PageRouteInfo<GroupDashboardRouteArgs> {
  GroupDashboardRoute({
    Key? key,
    required int groupId,
    List<PageRouteInfo>? children,
  }) : super(
          GroupDashboardRoute.name,
          args: GroupDashboardRouteArgs(
            key: key,
            groupId: groupId,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupDashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GroupDashboardRouteArgs>();
      return GroupDashboardScreen(
        key: args.key,
        groupId: args.groupId,
      );
    },
  );
}

class GroupDashboardRouteArgs {
  const GroupDashboardRouteArgs({
    this.key,
    required this.groupId,
  });

  final Key? key;

  final int groupId;

  @override
  String toString() {
    return 'GroupDashboardRouteArgs{key: $key, groupId: $groupId}';
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
