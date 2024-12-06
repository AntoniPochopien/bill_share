import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/widgets/app_bars/app_bar_with_actions.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ExpenseCreatorScreen extends StatelessWidget {
  const ExpenseCreatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BillshareScaffold(
      appBar: AppBarWithActions(),
      body: Column(children: [
        TitleWithUnderscore(title: 'Create Expense')
      ]),
    );
  }
}
