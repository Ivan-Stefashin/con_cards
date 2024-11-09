// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ConCards`
  String get nameOfApp {
    return Intl.message(
      'ConCards',
      name: 'nameOfApp',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get welcomeHello {
    return Intl.message(
      'Hello!',
      name: 'welcomeHello',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for trusting us.\nConCards is a convenient app for all your bank cards!`
  String get welcomeMessage {
    return Intl.message(
      'Thank you for trusting us.\nConCards is a convenient app for all your bank cards!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registeration {
    return Intl.message(
      'Registration',
      name: 'registeration',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password!`
  String get snackBarErrorMessageWrongEmail {
    return Intl.message(
      'Invalid email or password!',
      name: 'snackBarErrorMessageWrongEmail',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error, please try again.`
  String get snackBarErrorMessageUnknownError {
    return Intl.message(
      'Unknown error, please try again.',
      name: 'snackBarErrorMessageUnknownError',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get loginWelcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'loginWelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Log in to continue`
  String get logInToContinue {
    return Intl.message(
      'Log in to continue',
      name: 'logInToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Enter correct email`
  String get enterCorrectEmail {
    return Intl.message(
      'Enter correct email',
      name: 'enterCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get enterEmail {
    return Intl.message(
      'Enter email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Minimum of six characters`
  String get minimumOfSixCharacters {
    return Intl.message(
      'Minimum of six characters',
      name: 'minimumOfSixCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotYourPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Did not create an account?`
  String get didnTCreateAnAccount {
    return Intl.message(
      'Did not create an account?',
      name: 'didnTCreateAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get loginButtomBarRegistration {
    return Intl.message(
      'Registration',
      name: 'loginButtomBarRegistration',
      desc: '',
      args: [],
    );
  }

  /// `The user with this email has already been registered`
  String get theUserWithThisEmailHasAlreadyBeenRegistered {
    return Intl.message(
      'The user with this email has already been registered',
      name: 'theUserWithThisEmailHasAlreadyBeenRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get signUpHello {
    return Intl.message(
      'Hello!',
      name: 'signUpHello',
      desc: '',
      args: [],
    );
  }

  /// `Create new account`
  String get signUpCreateNewAccount {
    return Intl.message(
      'Create new account',
      name: 'signUpCreateNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Patronymic`
  String get patronymic {
    return Intl.message(
      'Patronymic',
      name: 'patronymic',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signUpLogIn {
    return Intl.message(
      'Sign In',
      name: 'signUpLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get bottomNavigationBarHome {
    return Intl.message(
      'Главная',
      name: 'bottomNavigationBarHome',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get bottomNavigatiomBarPerson {
    return Intl.message(
      'Профиль',
      name: 'bottomNavigatiomBarPerson',
      desc: '',
      args: [],
    );
  }

  /// `История`
  String get bottomNavigationBarHistory {
    return Intl.message(
      'История',
      name: 'bottomNavigationBarHistory',
      desc: '',
      args: [],
    );
  }

  /// `Всего`
  String get home_page_screan_total {
    return Intl.message(
      'Всего',
      name: 'home_page_screan_total',
      desc: '',
      args: [],
    );
  }

  /// `Нет данных`
  String get main_screan_no_data {
    return Intl.message(
      'Нет данных',
      name: 'main_screan_no_data',
      desc: '',
      args: [],
    );
  }

  /// `Все продукты`
  String get main_screan_all_products {
    return Intl.message(
      'Все продукты',
      name: 'main_screan_all_products',
      desc: '',
      args: [],
    );
  }

  /// `Оформить новый продукт`
  String get main_screan_get_new_product {
    return Intl.message(
      'Оформить новый продукт',
      name: 'main_screan_get_new_product',
      desc: '',
      args: [],
    );
  }

  /// `Заполните поле`
  String get signUp_enter_field {
    return Intl.message(
      'Заполните поле',
      name: 'signUp_enter_field',
      desc: '',
      args: [],
    );
  }

  /// `Email не существует.`
  String get email_address_not_authorized {
    return Intl.message(
      'Email не существует.',
      name: 'email_address_not_authorized',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
