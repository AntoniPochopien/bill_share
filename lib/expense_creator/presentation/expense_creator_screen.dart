import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/screens/error_screen.dart';
import 'package:bill_share/common/utils/validators.dart';
import 'package:bill_share/common/widgets/app_bars/app_bar_with_actions.dart';
import 'package:bill_share/common/widgets/billshare_text_field.dart';
import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/expense_creator/application/cubit/expense_creator_cubit.dart';
import 'package:bill_share/expense_creator/domain/i_expenses_repository.dart';
import 'package:bill_share/expense_creator/presentation/widgets/beneficients_section.dart';
import 'package:bill_share/expense_creator/presentation/widgets/done_animation_dialog.dart';
import 'package:bill_share/expense_creator/presentation/widgets/payer_selector_dialog.dart';
import 'package:bill_share/group_members_screen/presentation/widgets/member_tile.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ExpenseCreatorScreen extends StatefulWidget {
  final List<GroupMember> groupMembers;
  final int groupId;
  const ExpenseCreatorScreen({
    super.key,
    required this.groupMembers,
    required this.groupId,
  });

  @override
  State<ExpenseCreatorScreen> createState() => _ExpenseCreatorScreenState();
}

class _ExpenseCreatorScreenState extends State<ExpenseCreatorScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _showPayerSelector(
    BuildContext context, {
    required GroupMember payer,
    required List<GroupMember> groupMembers,
  }) async {
    final result = await showDialog<GroupMember>(
      context: context,
      builder: (context) => PayerSelectorDialog(
        actualPayer: payer,
        groupMembers: groupMembers,
      ),
    );
    if (result != null && context.mounted) {
      context.read<ExpenseCreatorCubit>().updatePayer(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpenseCreatorCubit(
        injectableUser: getIt<InjectableUser>(),
        iexpensesRepository: getIt<IExpensesRepository>(),
      )..init(
          gorupId: widget.groupId,
          groupMembers: widget.groupMembers,
        ),
      child: BlocConsumer<ExpenseCreatorCubit, ExpenseCreatorState>(
          listener: (context, state) {
            state.mapOrNull(initialized: (value) {
              if (value.created) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (ctx) => DoneAnimationDialog(
                    onDone: () => ctx.router
                        .popUntilRouteWithName(GroupNavigatorRoute.name),
                  ),
                );
              }
            });
          },
          builder: (context, state) => state.maybeMap(
                orElse: () => BillshareScaffold(),
                error: (value) =>
                    ErrorScreen(onRetry: () => context.maybePop()),
                initialized: (data) => BillshareScaffold(
                    appBar: AppBarWithActions(),
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleWithUnderscore(title: T(context).create_expense),
                        Expanded(
                          child: CustomScrollView(
                            slivers: [
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15),
                                                child: Text(
                                                  T(context)
                                                      .enter_the_title_of_expense,
                                                  style: Font.h4Grey,
                                                ),
                                              ),
                                              BillshareTextField(
                                                controller: _titleController,
                                                label: T(context).title,
                                                validator: (v) =>
                                                    Validators.titleValidator(
                                                        context, v),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15),
                                                child: Text(
                                                  T(context)
                                                      .how_much_did_it_cost,
                                                  style: Font.h4Grey,
                                                ),
                                              ),
                                              BillshareTextField(
                                                controller: _amountController,
                                                label: T(context).amount,
                                                validator: (v) =>
                                                    Validators.priceValidator(
                                                        context, v),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15),
                                                child: Text(
                                                  T(context).who_paid_for_this,
                                                  style: Font.h4Grey,
                                                ),
                                              ),
                                              MemberTile(
                                                groupMember: data.payer,
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  _showPayerSelector(context,
                                                      groupMembers:
                                                          data.groupMembers,
                                                      payer: data.payer);
                                                },
                                              ),
                                              BeneficientsSection(
                                                beneficiers: data.beneficiers,
                                                groupMembers: data.groupMembers,
                                                beneficiersIsEmptyError: data
                                                    .beneficiersIsEmptyError,
                                              ),
                                            ]),
                                      ),
                                      //TODO add selected beneficiers listview
                                      Button(
                                          text: T(context).add_expense,
                                          isLoading: data.isLoading,
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              if (data.beneficiers.isEmpty) {
                                                context
                                                    .read<ExpenseCreatorCubit>()
                                                    .setBeneficiersIsEmptyError(
                                                        true);
                                              } else {
                                                context
                                                    .read<ExpenseCreatorCubit>()
                                                    .createExpense(
                                                      title:
                                                          _titleController.text,
                                                      amount: double.parse(
                                                          _amountController
                                                              .text),
                                                    );
                                              }
                                            }
                                          })
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              )),
    );
  }
}
