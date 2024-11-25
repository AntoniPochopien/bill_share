import 'package:flutter/material.dart';

class BillshareScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final BottomNavigationBar? bottomNavigationBar;
  final EdgeInsets? padding;
  const BillshareScaffold(
      {super.key, this.body, this.appBar, this.bottomNavigationBar, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
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
