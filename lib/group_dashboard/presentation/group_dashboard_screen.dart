import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/group_dashboard/presentation/widget/info_box.dart';
import 'package:bill_share/group_dashboard/presentation/widget/member_tile_with_balance.dart';
import 'package:bill_share/group_navigator/application/cubit/group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GroupDashboardScreen extends StatelessWidget {
  const GroupDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupCubit, GroupState>(
      builder: (context, state) => state.maybeWhen(
          orElse: () => SizedBox(),
          data: (groupData) {
            final dashboardData = groupData.dashboardData;
            final total = dashboardData.toPay + dashboardData.toRecive;
            return BillshareScaffold(
              body: Column(children: [
                Row(children: [
                  Expanded(
                      child: InfoBox(
                          gradient: AppColors.blueGradientDark,
                          title: 'To pay',
                          value: dashboardData.toPay.abs())),
                  SizedBox(width: 24),
                  Expanded(
                      child: InfoBox(
                          gradient: AppColors.blueGradientLight,
                          title: 'To recive',
                          value: dashboardData.toRecive)),
                ]),
                SizedBox(height: 24),
                SizedBox(
                    height: 200,
                    child: InfoBox(
                        gradient: total > 0
                            ? AppColors.greenGradient
                            : AppColors.redGradient,
                        title: 'Total',
                        value: total)),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: dashboardData.membersWithBalance.length,
                    itemBuilder: (context, index) => MemberTileWithBalance(
                      memberWithBalance:
                          dashboardData.membersWithBalance[index],
                    ),
                  ),
                )
              ]),
            );
          }),
    );
  }
}
