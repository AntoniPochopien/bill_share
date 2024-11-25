import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BillshareScaffold();
  }
}