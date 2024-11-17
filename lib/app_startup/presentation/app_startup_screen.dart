import 'package:auto_route/auto_route.dart';
import 'package:bill_share/app_startup/application/cubit/app_startup_cubit.dart';
import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AppStartupScreen extends StatelessWidget {
  const AppStartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AppStartupCubit(iAuthRepository: getIt<IAuthRepository>())..init(),
        child: BlocListener<AppStartupCubit, AppStartupState>(
            listener: (context, state) {
              state.whenOrNull(
                authenticated: (user) {
                  context.pushRoute(DashboardRoute());
                },
                unauthenticated: () {
                  context.pushRoute(AuthRoute());
                },
              );
            },
            child: const Placeholder()));
  }
}
