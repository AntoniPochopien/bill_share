import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/domain/i_user_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/widgets/logout_button.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/home/application/profile_cubit/profile_cubit.dart';
import 'package:bill_share/home/presentation/widgets/dialogs/update_profile_dialog.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
          iUserRepository: getIt<IUserRepository>(),
          injectableUser: getIt<InjectableUser>()),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) => Drawer(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      onTap: () => showDialog(
                        context: context,
                        builder: (ctx) => UpdateProfileDialog(
                          onUpdate: (newUsername, newImage) async => context
                              .read<ProfileCubit>()
                              .updateUserProfile(
                                  newUsername: newUsername, newImage: newImage),
                          user: getIt<InjectableUser>().currentUser,
                        ),
                      ),
                      title: Text(T(context).profile),
                      trailing: Icon(Icons.person),
                    ),
                    ListTile(
                      onTap: () => context.pushRoute(SettingsRoute()),
                      title: Text(T(context).settings),
                      trailing: Icon(Icons.settings),
                    ),
                  ],
                ),
                LogoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
