import 'package:bill_share/common/widgets/logo.dart';
import 'package:flutter/material.dart';

class AppBarWithSettings extends StatelessWidget
    implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AppBarWithSettings({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: false,
        notificationPredicate: (_) => false,
        title: Logo(),
        actions: [
          IconButton(
              onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
              icon: Icon(Icons.settings))
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
