import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ChangeLanguageDialog extends StatelessWidget {
  final Function(Locale) onLanguageChange;
  const ChangeLanguageDialog({super.key, required this.onLanguageChange});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TitleWithUnderscore(
                title: T(context).choose_language,
              ),
              ...L10n.supported.map(
                (e) => ListTile(
                  title: Text(L10n.getNativeLangName(e.languageCode)),
                  onTap: () {
                    context.maybePop();
                    onLanguageChange(e);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
