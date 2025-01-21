import 'package:auto_route/auto_route.dart';
import 'package:bill_share/app_startup/application/cubit/app_startup_cubit.dart';
import 'package:bill_share/auth/application/cubit/auth_cubit.dart';
import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/domain/i_user_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

@RoutePage()
class AppStartupScreen extends StatelessWidget {
  const AppStartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthCubit(
                    iUserRepository: getIt<IUserRepository>(),
                    iAuthRepository: getIt<IAuthRepository>(),
                    injectableUser: getIt<InjectableUser>(),
                    iLocalStorageRepository: getIt<ILocalStorageRepository>(),
                  )..init()),
          BlocProvider(
              create: (context) => AppStartupCubit(
                  iLocalStorageRepository: getIt<ILocalStorageRepository>())
                ..init())
        ],
        child: BlocBuilder<AppStartupCubit, AppStartupState>(
          builder: (context, appStartupState) {
            return BlocListener<AuthCubit, AuthState>(
                listener: (context, authState) {
                  authState.whenOrNull(
                    authenticated: (user) {
                      appStartupState.whenOrNull(
                        navigateToGroup: (groupId) {
                          FlutterNativeSplash.remove();
                          context.replaceRoute(
                              GroupNavigatorRoute(groupId: groupId));
                        },
                        navigateToHome: () {
                          FlutterNativeSplash.remove();
                          context.replaceRoute(HomeRoute());
                        },
                      );
                    },
                    unauthenticated: () {
                      FlutterNativeSplash.remove();
                      context.replaceRoute(AuthRoute());
                    },
                  );
                },
                child: Scaffold());
          },
        ));
  }
}
