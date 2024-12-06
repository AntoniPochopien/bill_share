import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/screens/error_screen.dart';
import 'package:bill_share/common/widgets/app_bars/app_bar_with_actions.dart';
import 'package:bill_share/common/widgets/billshare_text_field.dart';
import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/expense_creator/application/cubit/expense_creator_cubit.dart';
import 'package:bill_share/expense_creator/presentation/widgets/beneficiers_selector_dialog.dart';
import 'package:bill_share/expense_creator/presentation/widgets/option_pill.dart';
import 'package:bill_share/group_members_screen/presentation/widgets/member_tile.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ExpenseCreatorScreen extends StatefulWidget {
  final List<GroupMember> groupMembers;
  const ExpenseCreatorScreen({
    super.key,
    required this.groupMembers,
  });

  @override
  State<ExpenseCreatorScreen> createState() => _ExpenseCreatorScreenState();
}

class _ExpenseCreatorScreenState extends State<ExpenseCreatorScreen> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  bool _areListsEqualAsSets(List<GroupMember> l1, List<GroupMember> l2) {
    final s1 = l1.toSet();
    final s2 = l2.toSet();
    return s1.containsAll(s2);
  }

  void _showBeneficiersSelector(
    BuildContext context, {
    required List<GroupMember> groupMembers,
    required List<GroupMember> selectedBeneficiers,
  }) async {
    final result = await showDialog<List<GroupMember>>(
      context: context,
      builder: (context) => BeneficiersSelectorDialog(
        groupMembers: groupMembers,
        alreadySelectedBEneficiers: selectedBeneficiers,
      ),
    );
    if (result != null && result.isNotEmpty && context.mounted) {
      context.read<ExpenseCreatorCubit>()
        ..removeAllBeneficiers()
        ..addBeneficiers(result);
    }
  }

  bool _isSomeSelected(
      {required List<GroupMember> selectedBeneficiers,
      required List<GroupMember> groupMembers}) {
    if (selectedBeneficiers.isNotEmpty &&
        selectedBeneficiers.length != groupMembers.length) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExpenseCreatorCubit(injectableUser: getIt<InjectableUser>())
            ..init(widget.groupMembers),
      child: BlocBuilder<ExpenseCreatorCubit, ExpenseCreatorState>(
          builder: (context, state) => state.maybeMap(
                orElse: () => BillshareScaffold(),
                error: (value) => ErrorScreen(
                    willPop: true, onRetry: () => context.maybePop()),
                initialized: (data) => BillshareScaffold(
                    appBar: AppBarWithActions(),
                    body: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleWithUnderscore(
                                          title: 'Create Expense'),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Text(
                                          'Podaj nazwę wydatku (np. zakupy, burger)',
                                          style: Font.h4Grey,
                                        ),
                                      ),
                                      BillshareTextField(
                                        controller: titleController,
                                        label: 'Title',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Text(
                                          'How much did you spend?',
                                          style: Font.h4Grey,
                                        ),
                                      ),
                                      BillshareTextField(
                                          controller: amountController,
                                          label: 'Amount'),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Text(
                                          'Who paid for this?',
                                          style: Font.h4Grey,
                                        ),
                                      ),
                                      Card(
                                        child:
                                            MemberTile(groupMember: data.payer),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Text(
                                          'Who needs to pay this back?',
                                          style: Font.h4Grey,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Row(children: [
                                          Expanded(
                                              flex: 3,
                                              child: OptionPill(
                                                  onTap: () => context
                                                      .read<
                                                          ExpenseCreatorCubit>()
                                                      .addAllBeneficiers(),
                                                  text: 'All',
                                                  isSelected:
                                                      _areListsEqualAsSets(
                                                    data.beneficiers,
                                                    data.groupMebers,
                                                  ))),
                                          Spacer(),
                                          Expanded(
                                              flex: 3,
                                              child: OptionPill(
                                                  onTap: () =>
                                                      _showBeneficiersSelector(
                                                        context,
                                                        groupMembers:
                                                            data.groupMebers,
                                                        selectedBeneficiers:
                                                            data.beneficiers,
                                                      ),
                                                  text: 'Some',
                                                  isSelected: _isSomeSelected(
                                                    selectedBeneficiers:
                                                        data.beneficiers,
                                                    groupMembers:
                                                        data.groupMebers,
                                                  ))),
                                        ]),
                                      ),
                                    ]),
                                // Expanded(
                                //     child: ListView.builder(
                                //         itemCount: 1,
                                //         itemBuilder: (context, index) => Text('sad'))),
                                Button(text: 'Add expense')
                              ]),
                        )
                      ],
                    )),
              )),
    );
  }
}
