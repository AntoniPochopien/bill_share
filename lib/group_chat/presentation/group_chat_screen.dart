import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/group_chat/presentation/widget/expense_bubble.dart';
import 'package:bill_share/group_navigator/application/cubit/group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupCubit, GroupState>(
        builder: (context, state) => state.maybeWhen(
              orElse: () => SizedBox(),
              data: (groupData) => BillshareScaffold(
                body: ListView.builder(
                  itemCount: groupData.expenses.length,
                  itemBuilder: (context, index) =>
                      ExpenseBubble(expense: groupData.expenses[index]),
                ),
              ),
            ));
  }
}
