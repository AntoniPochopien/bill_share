import 'package:bill_share/common/widgets/logo.dart';
import 'package:flutter/material.dart';

class AppBarWithSettings extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWithSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        notificationPredicate: (_) => false,
        title: Logo(),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
