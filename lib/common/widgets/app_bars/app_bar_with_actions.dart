import 'package:bill_share/common/widgets/logo.dart';
import 'package:flutter/material.dart';

class AppBarWithActions extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithActions({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: false,
        notificationPredicate: (_) => false,
        title: Logo(),
        actions: []);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
