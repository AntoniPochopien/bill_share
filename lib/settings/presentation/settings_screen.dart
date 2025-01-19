import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/l10n/application/cubit/language_cubit.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:bill_share/settings/presentation/dialogs/change_language_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, languageState) => BillshareScaffold(
        appBar: AppBar(
          title: Text(T(context).settings),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.language),
                title: Text(
                    '${T(context).language}: ${L10n.getNativeLangName(languageState.locale?.languageCode)}'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => ChangeLanguageDialog(
                      onLanguageChange: (newLocale) => context
                          .read<LanguageCubit>()
                          .setLocale(locale: newLocale),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
