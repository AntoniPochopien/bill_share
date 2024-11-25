import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/common/screens/error_screen.dart';
import 'package:bill_share/common/screens/loading_screen.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/group_navigator/application/cubit/group_cubit.dart';
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
            iLocalStorageRepository: getIt<ILocalStorageRepository>())
          ..init(groupId),
        child: BlocConsumer<GroupCubit, GroupState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (failure) {
                  if (failure == Failure.groupNotExists()) {
                    context.replaceRoute(HomeRoute());
                  }
                },
              );
            },
            builder: (context, state) => state.maybeWhen(
                  orElse: () => LoadingScreen(),
                  error: (failure) => ErrorScreen(onRetry: () {}),
                  data: () => GroupNavPage(),
                )));
  }
}
