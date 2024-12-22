import 'package:bill_share/auth/application/cubit/auth_cubit.dart';
import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        iAuthRepository: getIt<IAuthRepository>(),
        injectableUser: getIt<InjectableUser>(),
        iLocalStorageRepository: getIt<ILocalStorageRepository>(),
      ),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          context.router.replaceAll([AuthRoute()]);
        },
        builder: (context, state) => ListTile(
          onTap: () {
            context.read<AuthCubit>().logOut();
          },
          title: Text(T(context).logout),
          trailing: Icon(Icons.logout),
        ),
      ),
    );
  }
}
