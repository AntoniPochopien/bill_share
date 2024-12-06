import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Function onRetry;
  final bool willPop;
  const ErrorScreen({super.key, required this.onRetry, this.willPop = false});

  @override
  Widget build(BuildContext context) {
    return BillshareScaffold(
      body: Center(
        child:
            Button(text: willPop ? 'Ok' : 'Retry', onPressed: () => onRetry()),
      ),
    );
  }
}
