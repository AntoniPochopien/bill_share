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
import 'package:bill_share/expense_creator/presentation/widgets/beneficients_section.dart';
import 'package:bill_share/expense_creator/presentation/widgets/payer_selector_dialog.dart';
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
                                Form(
                                  key: _formKey,
                                  child: Column(
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
                                          controller: _titleController,
                                          label: 'Title',
                                          validator: (v) =>
                                              Validators.titleValidator(
                                                  context, v),
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
                                          controller: _amountController,
                                          label: 'Amount',
                                          validator: (v) =>
                                              Validators.priceValidator(
                                                  context, v),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15),
                                          child: Text(
                                            'Who paid for this?',
                                            style: Font.h4Grey,
                                          ),
                                        ),
                                        MemberTile(
                                          groupMember: data.payer,
                                          onTap: () => _showPayerSelector(
                                              context,
                                              groupMembers: data.groupMembers,
                                              payer: data.payer),
                                        ),
                                        BeneficientsSection(
                                          beneficiers: data.beneficiers,
                                          groupMembers: data.groupMembers,
                                          beneficiersIsEmptyError:
                                              data.beneficiersIsEmptyError,
                                        ),
                                      ]),
                                ),
                                // Expanded(
                                //     child: ListView.builder(
                                //         itemCount: 1,
                                //         itemBuilder: (context, index) => Text('sad'))),
                                Button(
                                    text: 'Add expense',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        if (data.beneficiers.isEmpty) {
                                          context
                                              .read<ExpenseCreatorCubit>()
                                              .setBeneficiersIsEmptyError(true);
                                        }else{
                                          //TODO
                                        }
                                      }
                                    })
                              ]),
                        )
                      ],
                    )),
              )),
    );
  }
}
