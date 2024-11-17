import 'package:flutter/material.dart';

class BillshareScaffold extends StatelessWidget {
  final Widget? body;
  const BillshareScaffold({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16),
          child: body,
        ),
      ),
    );
  }
}
