import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/application/cubit/auth_cubit.dart';
import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/screens/loading_screen.dart';
import 'package:bill_share/common/widgets/app_bars/app_bar_with_settings.dart';
import 'package:bill_share/common/widgets/modals/add_username_modal/add_username_modal.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/home/application/group_creator_cubit/group_creator_cubit.dart';
import 'package:bill_share/home/application/groups_cubit/groups_cubit.dart';
import 'package:bill_share/home/domain/i_groups_repository.dart';
import 'package:bill_share/home/presentation/widgets/groups_list_view.dart';
import 'package:bill_share/home/presentation/widgets/no_groups_view.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthCubit(
                  iAuthRepository: getIt<IAuthRepository>(),
                  injectableUser: getIt<InjectableUser>(),
                )..init()),
        BlocProvider(
            create: (context) => GroupCreatorCubit(
                  iGroupsRepository: getIt<IGroupsRepository>(),
                )),
        BlocProvider(
            create: (context) => GroupsCubit(
                iGroupsRepository: getIt<IGroupsRepository>(),
                injectableUser: getIt<InjectableUser>())
              ..fetchUserGroups())
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            unauthenticated: () {
              context.router.replaceAll([AuthRoute()]);
            },
            authenticated: (user) {
              if (user.username == null) {
                showModalBottomSheet(
                    context: context,
                    isDismissible: false,
                    isScrollControlled: true,
                    shape: ContinuousRectangleBorder(),
                    builder: (context) => AddUsernameModal());
              }
            },
          );
        },
        child: BlocConsumer<GroupCreatorCubit, GroupCreatorState>(
          listener: (context, state) {
            state.whenOrNull(
              created: (newGroup) {
                context.read<GroupsCubit>().addGroupToList(newGroup);
                context.pushRoute(GroupNavigatorRoute(groupId: newGroup.id));
              },
            );
          },
          builder: (context, state) => BlocBuilder<GroupsCubit, GroupsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => LoadingScreen(),
                groups: (groups) => BillshareScaffold(
                  appBar: AppBarWithSettings(),
                  body: groups.isEmpty
                      ? NoGroupsView()
                      : GroupsListView(groups: groups),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
