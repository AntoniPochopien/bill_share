import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl')
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'Bill Share'**
  String get app_name;

  /// No description provided for @auth_provided_email_has_wrong.
  ///
  /// In en, this message translates to:
  /// **'Provided email has wrong format'**
  String get auth_provided_email_has_wrong;

  /// No description provided for @wrong_format.
  ///
  /// In en, this message translates to:
  /// **'Wrong format'**
  String get wrong_format;

  /// No description provided for @auth_email_is_already_in_use.
  ///
  /// In en, this message translates to:
  /// **'Email is already in use'**
  String get auth_email_is_already_in_use;

  /// No description provided for @auth_password_too_short.
  ///
  /// In en, this message translates to:
  /// **'Password is too short'**
  String get auth_password_too_short;

  /// No description provided for @auth_wrong_credentials.
  ///
  /// In en, this message translates to:
  /// **'Wrong credentials'**
  String get auth_wrong_credentials;

  /// No description provided for @auth_username_or_password.
  ///
  /// In en, this message translates to:
  /// **'Username or password are incorrect'**
  String get auth_username_or_password;

  /// No description provided for @auth_passwords_are_not_the_same.
  ///
  /// In en, this message translates to:
  /// **'Passwords are not the same'**
  String get auth_passwords_are_not_the_same;

  /// No description provided for @auth_password_must_contains.
  ///
  /// In en, this message translates to:
  /// **'Password must contains at least one number and uppercase'**
  String get auth_password_must_contains;

  /// No description provided for @this_field_cannot.
  ///
  /// In en, this message translates to:
  /// **'This field cannot be empty'**
  String get this_field_cannot;

  /// No description provided for @auth_username_is_too_short.
  ///
  /// In en, this message translates to:
  /// **'Username is too short'**
  String get auth_username_is_too_short;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_in;

  /// No description provided for @access_to_your_account.
  ///
  /// In en, this message translates to:
  /// **'Access to your account'**
  String get access_to_your_account;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @repeat_password.
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get repeat_password;

  /// No description provided for @already_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account'**
  String get already_have_an_account;

  /// No description provided for @the_session_has_expired.
  ///
  /// In en, this message translates to:
  /// **'The session has expired'**
  String get the_session_has_expired;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @unexpected_error_occurred.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred, we are working on it!'**
  String get unexpected_error_occurred;

  /// No description provided for @you_will_be_logged_out.
  ///
  /// In en, this message translates to:
  /// **'You will be logged out, please log in again'**
  String get you_will_be_logged_out;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @add_username.
  ///
  /// In en, this message translates to:
  /// **'Add username'**
  String get add_username;

  /// No description provided for @introduce_yourself.
  ///
  /// In en, this message translates to:
  /// **'Introduce yourself with your username'**
  String get introduce_yourself;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @enter_group_code.
  ///
  /// In en, this message translates to:
  /// **'Enter group Code'**
  String get enter_group_code;

  /// No description provided for @join_existing_group_description.
  ///
  /// In en, this message translates to:
  /// **'To join to existing group, provide group code'**
  String get join_existing_group_description;

  /// No description provided for @or_text.
  ///
  /// In en, this message translates to:
  /// **'or...'**
  String get or_text;

  /// No description provided for @create_group.
  ///
  /// In en, this message translates to:
  /// **'Create group'**
  String get create_group;

  /// No description provided for @group_name.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get group_name;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @your_groups.
  ///
  /// In en, this message translates to:
  /// **'Your groups'**
  String get your_groups;

  /// No description provided for @enter_valid_price.
  ///
  /// In en, this message translates to:
  /// **'Enter valid price'**
  String get enter_valid_price;

  /// No description provided for @create_expense.
  ///
  /// In en, this message translates to:
  /// **'Create Expense'**
  String get create_expense;

  /// No description provided for @enter_the_title_of_expense.
  ///
  /// In en, this message translates to:
  /// **'Enter the title of the expense (e.g. shopping, burger)'**
  String get enter_the_title_of_expense;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @how_much_did_it_cost.
  ///
  /// In en, this message translates to:
  /// **'How much did it cost?'**
  String get how_much_did_it_cost;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @who_paid_for_this.
  ///
  /// In en, this message translates to:
  /// **'Who paid for this?'**
  String get who_paid_for_this;

  /// No description provided for @add_expense.
  ///
  /// In en, this message translates to:
  /// **'Add expense'**
  String get add_expense;

  /// No description provided for @who_needs_to_pay_this_back.
  ///
  /// In en, this message translates to:
  /// **'Who needs to pay this back?'**
  String get who_needs_to_pay_this_back;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @some.
  ///
  /// In en, this message translates to:
  /// **'Some'**
  String get some;

  /// No description provided for @at_least_one_debtor_needs_to_be_selected.
  ///
  /// In en, this message translates to:
  /// **'At least one debtor needs to be selected.'**
  String get at_least_one_debtor_needs_to_be_selected;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @select_payer.
  ///
  /// In en, this message translates to:
  /// **'Select payer'**
  String get select_payer;

  /// No description provided for @select_debtors.
  ///
  /// In en, this message translates to:
  /// **'Select debtors'**
  String get select_debtors;

  /// No description provided for @members.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get members;

  /// No description provided for @access_code.
  ///
  /// In en, this message translates to:
  /// **'Access code'**
  String get access_code;

  /// No description provided for @give_this_code_someone.
  ///
  /// In en, this message translates to:
  /// **'Give this code, someone who wants to join the group'**
  String get give_this_code_someone;

  /// No description provided for @switch_group.
  ///
  /// In en, this message translates to:
  /// **'Switch group'**
  String get switch_group;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @update_group_name.
  ///
  /// In en, this message translates to:
  /// **'Update group name'**
  String get update_group_name;

  /// No description provided for @change_group_name_description.
  ///
  /// In en, this message translates to:
  /// **'You can change group name anytime'**
  String get change_group_name_description;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @choose_language.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get choose_language;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @to_pay.
  ///
  /// In en, this message translates to:
  /// **'To pay'**
  String get to_pay;

  /// No description provided for @to_receive.
  ///
  /// In en, this message translates to:
  /// **'To receive'**
  String get to_receive;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @your_profile.
  ///
  /// In en, this message translates to:
  /// **'Your profile'**
  String get your_profile;

  /// No description provided for @update_profile_description.
  ///
  /// In en, this message translates to:
  /// **'You can update your information anytime'**
  String get update_profile_description;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get choose;

  /// No description provided for @create_or_join_group.
  ///
  /// In en, this message translates to:
  /// **'Create group, or join existing one'**
  String get create_or_join_group;

  /// No description provided for @join.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get join;

  /// No description provided for @join_group.
  ///
  /// In en, this message translates to:
  /// **'Join group'**
  String get join_group;

  /// No description provided for @go_premium.
  ///
  /// In en, this message translates to:
  /// **'Go Premium'**
  String get go_premium;

  /// No description provided for @buy_premium_to_create.
  ///
  /// In en, this message translates to:
  /// **'Buy premium to create or join more groups.'**
  String get buy_premium_to_create;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @nothing_here_yet.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get nothing_here_yet;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @or_sign_in_with.
  ///
  /// In en, this message translates to:
  /// **'Or Sign In With'**
  String get or_sign_in_with;

  /// No description provided for @sign_in_with_google.
  ///
  /// In en, this message translates to:
  /// **'Sign in with google'**
  String get sign_in_with_google;

  /// No description provided for @sign_in_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get sign_in_with_apple;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account'**
  String get already_have_account;

  /// No description provided for @sign_up_with_email.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Email'**
  String get sign_up_with_email;

  /// No description provided for @privacy_policy_info.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy Info'**
  String get privacy_policy_info;

  /// No description provided for @user_already_exists.
  ///
  /// In en, this message translates to:
  /// **'User already exists'**
  String get user_already_exists;

  /// No description provided for @account_with_this_email_already_exists.
  ///
  /// In en, this message translates to:
  /// **'An account with this email already exists. Log in or use a different email address to create a new account.'**
  String get account_with_this_email_already_exists;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
