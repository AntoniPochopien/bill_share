import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GroupMembersScreen extends StatelessWidget {
  const GroupMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BillshareScaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TitleWithUnderscore(title: 'Members'),
        ),
        Expanded(
            child:
                ListView.builder(itemBuilder: (context, index) => Text('sda'))),
      ]),
    );
  }
}
