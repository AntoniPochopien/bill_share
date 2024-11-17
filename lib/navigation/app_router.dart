import 'package:auto_route/auto_route.dart';
import 'package:bill_share/app_startup/presentation/app_startup_screen.dart';
import 'package:bill_share/auth/presentation/auth_screen.dart';
import 'package:bill_share/dashboard/presentation/dashboard_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppStartupRoute.page, initial: true),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: DashboardRoute.page),
      ];
}
