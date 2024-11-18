import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/application/cubit/auth_cubit.dart';
import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthCubit(iAuthRepository: getIt<IAuthRepository>())..init(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            unauthenticated: () {
              context.router.replaceAll([AuthRoute()]);
            },
          );
        },
        child: BillshareScaffold(
          body: Column(
            children: [
              Button(
                  text: 'Log out',
                  onPressed: () async =>
                      await getIt<IAuthRepository>().logOut())
            ],
          ),
        ),
      ),
    );
  }
}