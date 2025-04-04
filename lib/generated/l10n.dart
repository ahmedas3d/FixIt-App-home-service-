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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Welcome to FixIt`
  String get welcomeToFixit {
    return Intl.message(
      'Welcome to FixIt',
      name: 'welcomeToFixit',
      desc: '',
      args: [],
    );
  }

  /// `Discover a world of convenience and reliability. FIXit is your one stop solution for all your home service needs`
  String get descriptionOn1 {
    return Intl.message(
      'Discover a world of convenience and reliability. FIXit is your one stop solution for all your home service needs',
      name: 'descriptionOn1',
      desc: '',
      args: [],
    );
  }

  /// `Find Services`
  String get titleOn2 {
    return Intl.message('Find Services', name: 'titleOn2', desc: '', args: []);
  }

  /// `We provide a wide range of services to make your life easier. Our services include but are not limited to: cleaning, gardening, plumbing, electrical, appliance repair, and more.`
  String get descriptionOn2 {
    return Intl.message(
      'We provide a wide range of services to make your life easier. Our services include but are not limited to: cleaning, gardening, plumbing, electrical, appliance repair, and more.',
      name: 'descriptionOn2',
      desc: '',
      args: [],
    );
  }

  /// `Book Services`
  String get titleOn3 {
    return Intl.message('Book Services', name: 'titleOn3', desc: '', args: []);
  }

  /// `Browse and book a wide range of services from plumbing and electrical to appliance repair. We’ve got it all covered!`
  String get descriptionOn3 {
    return Intl.message(
      'Browse and book a wide range of services from plumbing and electrical to appliance repair. We’ve got it all covered!',
      name: 'descriptionOn3',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Enter your email and password to login`
  String get enterYourEmailAndPasswordToLogin {
    return Intl.message(
      'Enter your email and password to login',
      name: 'enterYourEmailAndPasswordToLogin',
      desc: '',
      args: [],
    );
  }

  /// `New to fixIt?`
  String get newToFixIt {
    return Intl.message(
      'New to fixIt?',
      name: 'newToFixIt',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Now`
  String get signUpNow {
    return Intl.message('Sign Up Now', name: 'signUpNow', desc: '', args: []);
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Facebook`
  String get facebook {
    return Intl.message('Facebook', name: 'facebook', desc: '', args: []);
  }

  /// `Google`
  String get google {
    return Intl.message('Google', name: 'google', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
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

  /// `Sign In Now`
  String get signInNow {
    return Intl.message('Sign In Now', name: 'signInNow', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Enter your full name`
  String get enterYourFullName {
    return Intl.message(
      'Enter your full name',
      name: 'enterYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `I Agree With FixIt’s WeTrm & Conditions`
  String get iAgreeWithFixItsTermAndConditions {
    return Intl.message(
      'I Agree With FixIt’s WeTrm & Conditions',
      name: 'iAgreeWithFixItsTermAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Success`
  String get signUpSuccess {
    return Intl.message(
      'Sign Up Success',
      name: 'signUpSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Verification Email Sent!`
  String get verificationEmailSent {
    return Intl.message(
      'Verification Email Sent!',
      name: 'verificationEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email and verify your account to continue : {email}!`
  String verifydescription(Object email) {
    return Intl.message(
      'Please check your email and verify your account to continue : $email!',
      name: 'verifydescription',
      desc: '',
      args: [email],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to FixIt, your one-stop solution for all your home service needs`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to FixIt, your one-stop solution for all your home service needs',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Please check your email and password`
  String get errorDescription {
    return Intl.message(
      'Please check your email and password',
      name: 'errorDescription',
      desc: '',
      args: [],
    );
  }

  /// `Discord`
  String get discord {
    return Intl.message('Discord', name: 'discord', desc: '', args: []);
  }

  /// `Sign Up Success!`
  String get successSignUp {
    return Intl.message(
      'Sign Up Success!',
      name: 'successSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed:`
  String get loginFailed {
    return Intl.message(
      'Login Failed:',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Popular Services`
  String get popularServices {
    return Intl.message(
      'Popular Services',
      name: 'popularServices',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message('View All', name: 'viewAll', desc: '', args: []);
  }

  /// `Service Providers`
  String get serviceProviders {
    return Intl.message(
      'Service Providers',
      name: 'serviceProviders',
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
