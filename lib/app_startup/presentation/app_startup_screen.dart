import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/application/cubit/auth_cubit.dart';
import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
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
        create: (context) => AuthCubit(
            iAuthRepository: getIt<IAuthRepository>(),
            injectableUser: getIt<InjectableUser>())
          ..init(),
        child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              state.whenOrNull(
                authenticated: (user) {
                  //TODO detect if user have any group, then pass to group_dashboard or home screen
                  context.replaceRoute(HomeRoute());
                },
                unauthenticated: () {
                  context.replaceRoute(AuthRoute());
                },
              );
            },
            child: const Placeholder()));
  }
}
