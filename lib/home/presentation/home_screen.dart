import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/application/cubit/auth_cubit.dart';
import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/widgets/logo.dart';
import 'package:bill_share/common/widgets/modals/add_username_modal/add_username_modal.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/home/application/group_creator_cubit/group_creator_cubit.dart';
import 'package:bill_share/home/application/groups_cubit/groups_cubit.dart';
import 'package:bill_share/home/domain/i_groups_repository.dart';
import 'package:bill_share/home/presentation/widgets/modals/create_group_modal.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final baseDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.grey),
    );

    final defaultPinTheme = PinTheme(
      height: 42,
      width: 42,
      decoration: baseDecoration,
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: baseDecoration.copyWith(
        border: Border.all(width: 2, color: AppColors.green),
      ),
    );

    final modalShape = ContinuousRectangleBorder();
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
                    shape: modalShape,
                    builder: (context) => AddUsernameModal());
              }
            },
          );
        },
        child: BlocConsumer<GroupCreatorCubit, GroupCreatorState>(
          listener: (context, state) {
            state.whenOrNull(
              created: (id) {
                context.pushRoute(GroupDashboardRoute(groupId: id));
              },
            );
          },
          builder: (context, state) => BlocBuilder<GroupsCubit, GroupsState>(
            builder: (context, state) {
              return BillshareScaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Logo(size: 87),
                    Column(children: [
                      TitleWithUnderscore(
                        title: T(context).enter_group_code,
                        description: T(context).join_existing_group_description,
                      ),
                      SizedBox(height: 28),
                      Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 19),
                        child: Text(T(context).or_text),
                      ),
                      GestureDetector(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: modalShape,
                              builder: (ctx) => CreateGroupModal(
                                    groupCreatorCubit:
                                        context.read<GroupCreatorCubit>(),
                                  )),
                          child: Text(T(context).create_group,
                              style: Font.h4Green))
                    ]),
                    SizedBox(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
