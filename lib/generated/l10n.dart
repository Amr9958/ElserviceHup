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

  /// `Welcome to `
  String get onBoardingOneTitle {
    return Intl.message(
      'Welcome to ',
      name: 'onBoardingOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get onBoardingTwoTitle {
    return Intl.message(
      'Search and Shop',
      name: 'onBoardingTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide collection of premium fresh fruits and enjoy the best deals and high quality.`
  String get onBoardingSubTitle {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide collection of premium fresh fruits and enjoy the best deals and high quality.',
      name: 'onBoardingSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the finest carefully selected fruits. Check out the details, images, and reviews to ensure you choose the perfect fruit.`
  String get onBoardingTwoSubTitle {
    return Intl.message(
      'We offer you the finest carefully selected fruits. Check out the details, images, and reviews to ensure you choose the perfect fruit.',
      name: 'onBoardingTwoSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get onBoardingSkip {
    return Intl.message(
      'Skip',
      name: 'onBoardingSkip',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get onBoardingButton {
    return Intl.message(
      'Start Now',
      name: 'onBoardingButton',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginAppBarTitle {
    return Intl.message(
      'Login',
      name: 'loginAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Did you forget your password ?`
  String get loginForgotPassword {
    return Intl.message(
      'Did you forget your password ?',
      name: 'loginForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an account ? `
  String get loginDontHaveAccount {
    return Intl.message(
      'Dont have an account ? ',
      name: 'loginDontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get loginRegisterNow {
    return Intl.message(
      'Register Now',
      name: 'loginRegisterNow',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get loginDivider {
    return Intl.message(
      'or',
      name: 'loginDivider',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get loginWithFacebook {
    return Intl.message(
      'Login with Facebook',
      name: 'loginWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get LoginWithApple {
    return Intl.message(
      'Login with Apple',
      name: 'LoginWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailField {
    return Intl.message(
      'Email',
      name: 'emailField',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordField {
    return Intl.message(
      'Password',
      name: 'passwordField',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get nameField {
    return Intl.message(
      'Full Name',
      name: 'nameField',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get sindUPAppBarTitle {
    return Intl.message(
      'New Account',
      name: 'sindUPAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account ?`
  String get singUpCheckAccount {
    return Intl.message(
      'Already have an account ?',
      name: 'singUpCheckAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get singUpLogin {
    return Intl.message(
      'Login',
      name: 'singUpLogin',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPasswordAppBarTitle {
    return Intl.message(
      'Forget Password',
      name: 'forgetPasswordAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, just enter your phone number and we will send you a verification code.`
  String get ForgotPasswordTitle {
    return Intl.message(
      'Don\'t worry, just enter your phone number and we will send you a verification code.',
      name: 'ForgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPasswordButton {
    return Intl.message(
      'Forget Password',
      name: 'forgetPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePasswordAppBarTitle {
    return Intl.message(
      'Change Password',
      name: 'changePasswordAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create a New Password`
  String get changePasswordButton {
    return Intl.message(
      'Create a New Password',
      name: 'changePasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get changePasswordPassword {
    return Intl.message(
      'Password',
      name: 'changePasswordPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get changePasswordConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'changePasswordConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create a new password to log in`
  String get changePasswordTitle {
    return Intl.message(
      'Create a new password to log in',
      name: 'changePasswordTitle',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
