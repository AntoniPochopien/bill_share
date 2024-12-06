import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';

class Validators {
  static String? emailValidator(BuildContext context, String? v) {
    if (v == null || v.isEmpty) {
      return T(context).this_field_cannot;
    } else if (!v.contains("@") || !v.contains(".") || v.contains(' ')) {
      return T(context).auth_provided_email_has_wrong;
    } else {
      return null;
    }
  }

  static String? passwordValidator(BuildContext context, String? v) {
    if (v == null || v.isEmpty) {
      return T(context).this_field_cannot;
    } else if (v.length < 6) {
      return T(context).auth_password_too_short;
    } else if (v.contains(' ')) {
      return T(context).wrong_format;
    } else if (!v.contains(RegExp(r'[A-Z]')) && !v.contains(RegExp(r'[0-9]'))) {
      return T(context).auth_password_must_contains;
    } else {
      return null;
    }
  }

  static String? repeatPasswordValidator(
      BuildContext context, String? v, String? v2) {
    if (v == null || v.isEmpty) {
      return T(context).this_field_cannot;
    } else if (v != v2) {
      return T(context).auth_passwords_are_not_the_same;
    } else {
      return null;
    }
  }

  static String? usernameValidator(BuildContext context, String? v) {
    if (v == null || v.isEmpty) {
      return T(context).this_field_cannot;
    } else if (v.length < 3) {
      return T(context).auth_username_is_too_short;
    } else if (v.contains(' ')) {
      return T(context).wrong_format;
    } else {
      return null;
    }
  }

  static String? groupNameValidator(BuildContext context, String? v) {
    if (v == null || v.isEmpty) {
      return T(context).this_field_cannot;
    } else {
      return null;
    }
  }

  static String? titleValidator(BuildContext context, String? v) {
    if (v == null || v.isEmpty) {
      return T(context).this_field_cannot;
    } else {
      return null;
    }
  }

  static String? priceValidator(BuildContext context, String? v) {
    final regex = RegExp(r'^\d+(\.\d{1,2})?$');
    if (v == null || v.isEmpty) {
      return T(context).this_field_cannot;
    } else if (!regex.hasMatch(v)) {
      return T(context).enter_valid_price;
    } 
    return null;
  }
}
