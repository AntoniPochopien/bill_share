import 'package:flutter/material.dart';

class BillshareScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final BottomNavigationBar? bottomNavigationBar;
  final EdgeInsets? padding;
  final Widget? floatingActionButton;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? endDrawer;

  const BillshareScaffold({
    super.key,
    this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.padding,
    this.floatingActionButton,
    this.scaffoldKey,
    this.endDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: appBar,
        endDrawer: endDrawer,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: floatingActionButton,
        body: SafeArea(
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            child: body,
          ),
        ),
      ),
    );
  }
}
