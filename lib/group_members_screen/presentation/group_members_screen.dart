import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GroupMembersScreen extends StatelessWidget {
  const GroupMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BillshareScaffold();
  }
}