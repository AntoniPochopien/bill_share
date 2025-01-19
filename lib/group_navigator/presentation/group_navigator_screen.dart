import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/domain/i_user_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/screens/error_screen.dart';
import 'package:bill_share/common/screens/loading_screen.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/expense_creator/domain/i_expenses_repository.dart';
import 'package:bill_share/group_navigator/application/cubit/group_cubit.dart';
import 'package:bill_share/group_navigator/domain/i_group_repository.dart';
import 'package:bill_share/group_navigator/presentation/widgets/group_nav_page.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GroupNavigatorScreen extends StatelessWidget {
  final int groupId;
  const GroupNavigatorScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GroupCubit(
              iGroupRepository: getIt<IGroupRepository>(),
              iLocalStorageRepository: getIt<ILocalStorageRepository>(),
              iExpensesRepository: getIt<IExpensesRepository>(),
              injectableUser: getIt<InjectableUser>(),
              iUserRepository: getIt<IUserRepository>(),
            )..init(groupId),
        child: BlocConsumer<GroupCubit, GroupState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (failure) {
                  failure.whenOrNull(
                    groupNotExists: () => context.replaceRoute(HomeRoute()),
                    dontBelongToGroup: () => context.replaceRoute(HomeRoute()),
                  );
                },
              );
            },
            builder: (context, state) => state.maybeWhen(
                  orElse: () => LoadingScreen(),
                  error: (failure) => failure.maybeWhen(
                      orElse: () => ErrorScreen(
                          onRetry: () =>
                              context.read<GroupCubit>().init(groupId)),
                      dontBelongToGroup: () => SizedBox(),
                      groupNotExists: () => SizedBox()),
                  data: (members) => GroupNavPage(),
                )));
  }
}
