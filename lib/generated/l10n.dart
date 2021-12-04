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

  /// `Story`
  String get introTitle {
    return Intl.message(
      'Story',
      name: 'introTitle',
      desc: '',
      args: [],
    );
  }

  /// `Member`
  String get memberLabel {
    return Intl.message(
      'Member',
      name: 'memberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Setup Membership`
  String get setupMembershipTitle {
    return Intl.message(
      'Setup Membership',
      name: 'setupMembershipTitle',
      desc: '',
      args: [],
    );
  }

  /// `Store badge in smartphone.`
  String get setupMembershipExplanation {
    return Intl.message(
      'Store badge in smartphone.',
      name: 'setupMembershipExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Shop as a Member`
  String get shopAsMemberTitle {
    return Intl.message(
      'Shop as a Member',
      name: 'shopAsMemberTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Product Suggestion`
  String get createProductSuggestionTitle {
    return Intl.message(
      'Create Product Suggestion',
      name: 'createProductSuggestionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Suggest single product.`
  String get createProductSuggestionExplanation {
    return Intl.message(
      'Suggest single product.',
      name: 'createProductSuggestionExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Create Assortment Suggestion`
  String get createAssortmentSuggestionTitle {
    return Intl.message(
      'Create Assortment Suggestion',
      name: 'createAssortmentSuggestionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Suggest multiple products at once.`
  String get createAssortmentSuggestionExplanation {
    return Intl.message(
      'Suggest multiple products at once.',
      name: 'createAssortmentSuggestionExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Scan Result`
  String get scanResultTitle {
    return Intl.message(
      'Scan Result',
      name: 'scanResultTitle',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get resultLabel {
    return Intl.message(
      'Result',
      name: 'resultLabel',
      desc: '',
      args: [],
    );
  }

  /// `Raw Content`
  String get rawContentLabel {
    return Intl.message(
      'Raw Content',
      name: 'rawContentLabel',
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
      Locale.fromSubtags(languageCode: 'de'),
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
