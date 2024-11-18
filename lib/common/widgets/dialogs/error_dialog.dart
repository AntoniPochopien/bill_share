import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String description;
  const ErrorDialog({
    super.key,
    required this.description,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(description),
      actions: [
        Button(text: T(context).ok, onPressed: () => context.maybePop()),
      ],
    );
  }
}
