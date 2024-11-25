import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GroupDashboardScreen extends StatelessWidget {
  const GroupDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BillshareScaffold();
  }
}