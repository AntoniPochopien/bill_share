import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GroupDashboardScreen extends StatelessWidget {
  final int groupId;
  const GroupDashboardScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return BillshareScaffold();
  }
}