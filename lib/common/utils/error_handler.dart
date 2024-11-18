import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/common/widgets/dialogs/error_dialog.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  static void showErrorDialog(BuildContext context,
      {required Failure failure}) {
    showDialog(
        context: context,
        builder: (context) => ErrorDialog(
              title: _getDialogTitle(context, failure),
              description: _getDialogDescription(context, failure),
            ));
  }

  static String _getDialogTitle(BuildContext context, Failure failure) =>
      failure.maybeWhen(
        unauthorized: () => T(context).the_session_has_expired,
        wrongCredentials: () => T(context).auth_wrong_credentials,
        orElse: () => T(context).error,
      );

  static String _getDialogDescription(BuildContext context, Failure failure) =>
      failure.maybeWhen(
          unauthorized: () => T(context).you_will_be_logged_out,
          wrongCredentials: () => T(context).auth_username_or_password,
          orElse: () => T(context).unexpected_error_occurred);
}
