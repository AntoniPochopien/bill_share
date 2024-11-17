import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/presentation/auth_screen.dart';
import 'package:bill_share/dashboard/presentation/dashboard_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page, initial: true),
        AutoRoute(page: DashboardRoute.page),
      ];
}
