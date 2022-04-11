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

  /// `Unable to complete action. Server error ({statusCode}):\n{message}`
  String apiError(Object statusCode, Object message) {
    return Intl.message(
      'Unable to complete action. Server error ($statusCode):\n$message',
      name: 'apiError',
      desc: '',
      args: [statusCode, message],
    );
  }

  /// `Please enter your Email`
  String get signupEmptyEmail {
    return Intl.message(
      'Please enter your Email',
      name: 'signupEmptyEmail',
      desc: '',
      args: [],
    );
  }

  /// `The format doesn't look right. Please check again`
  String get entVEmain {
    return Intl.message(
      'The format doesn\'t look right. Please check again',
      name: 'entVEmain',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a Password`
  String get entPass {
    return Intl.message(
      'Please enter a Password',
      name: 'entPass',
      desc: '',
      args: [],
    );
  }

  /// `Password must be 8 characters long`
  String get passLength {
    return Intl.message(
      'Password must be 8 characters long',
      name: 'passLength',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logoutAlertMessage {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutAlertMessage',
      desc: '',
      args: [],
    );
  }

  /// `How are you Feeling?`
  String get howAreYouFeeling {
    return Intl.message(
      'How are you Feeling?',
      name: 'howAreYouFeeling',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Add your happy place`
  String get addYourHappyPlace {
    return Intl.message(
      'Add your happy place',
      name: 'addYourHappyPlace',
      desc: '',
      args: [],
    );
  }

  /// `Where are you?`
  String get whereAreYou {
    return Intl.message(
      'Where are you?',
      name: 'whereAreYou',
      desc: '',
      args: [],
    );
  }

  /// `What are you doing here?`
  String get whatAreYouDoing {
    return Intl.message(
      'What are you doing here?',
      name: 'whatAreYouDoing',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get complete {
    return Intl.message(
      'Complete',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `My Happiness`
  String get myHappiness {
    return Intl.message(
      'My Happiness',
      name: 'myHappiness',
      desc: '',
      args: [],
    );
  }

  /// `How do you Feel about this place?`
  String get howDoYouFeelAboutThisPlace {
    return Intl.message(
      'How do you Feel about this place?',
      name: 'howDoYouFeelAboutThisPlace',
      desc: '',
      args: [],
    );
  }

  /// `My Posts`
  String get my_posts {
    return Intl.message(
      'My Posts',
      name: 'my_posts',
      desc: '',
      args: [],
    );
  }

  /// `View all Posts`
  String get view_all_posts {
    return Intl.message(
      'View all Posts',
      name: 'view_all_posts',
      desc: '',
      args: [],
    );
  }

  /// `Shared with Me`
  String get shared_with_me {
    return Intl.message(
      'Shared with Me',
      name: 'shared_with_me',
      desc: '',
      args: [],
    );
  }

  /// `We keep your posts private unless you want to share. Who do you want to share with?`
  String get we_keep_your_posts {
    return Intl.message(
      'We keep your posts private unless you want to share. Who do you want to share with?',
      name: 'we_keep_your_posts',
      desc: '',
      args: [],
    );
  }

  /// `Enter first name`
  String get enter_first_name {
    return Intl.message(
      'Enter first name',
      name: 'enter_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter last name`
  String get enter_last_name {
    return Intl.message(
      'Enter last name',
      name: 'enter_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter user name`
  String get enter_username {
    return Intl.message(
      'Enter user name',
      name: 'enter_username',
      desc: '',
      args: [],
    );
  }

  /// `Enter location`
  String get enter_location {
    return Intl.message(
      'Enter location',
      name: 'enter_location',
      desc: '',
      args: [],
    );
  }

  /// `Enter bio`
  String get enter_bio {
    return Intl.message(
      'Enter bio',
      name: 'enter_bio',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get enter_email {
    return Intl.message(
      'Enter email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter post caption`
  String get enter_post_caption {
    return Intl.message(
      'Enter post caption',
      name: 'enter_post_caption',
      desc: '',
      args: [],
    );
  }

  /// `Select someone first`
  String get select_someone_first {
    return Intl.message(
      'Select someone first',
      name: 'select_someone_first',
      desc: '',
      args: [],
    );
  }

  /// `Enter current signup`
  String get enter_current_password {
    return Intl.message(
      'Enter current signup',
      name: 'enter_current_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enter_new_password {
    return Intl.message(
      'Enter new password',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter same password`
  String get enter_confirm_password {
    return Intl.message(
      'Enter same password',
      name: 'enter_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
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
