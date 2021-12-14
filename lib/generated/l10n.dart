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

  /// `Suggest Product`
  String get createProductSuggestionTitle {
    return Intl.message(
      'Suggest Product',
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

  /// `Suggest Assortment`
  String get createAssortmentSuggestionTitle {
    return Intl.message(
      'Suggest Assortment',
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

  /// `Scan barcode`
  String get scanBarCodeTitle {
    return Intl.message(
      'Scan barcode',
      name: 'scanBarCodeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hold the barcode in front of the camera so that it can be seen in its entirety.`
  String get alignWithBarcodeExplanation {
    return Intl.message(
      'Hold the barcode in front of the camera so that it can be seen in its entirety.',
      name: 'alignWithBarcodeExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Membership`
  String get membershipTitle {
    return Intl.message(
      'Membership',
      name: 'membershipTitle',
      desc: '',
      args: [],
    );
  }

  /// `Show this barcode at the checkout in the store.`
  String get showBarcodeAtPOSLabel {
    return Intl.message(
      'Show this barcode at the checkout in the store.',
      name: 'showBarcodeAtPOSLabel',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo of the product you want to suggest.`
  String get suggestProductInstructionText {
    return Intl.message(
      'Take a photo of the product you want to suggest.',
      name: 'suggestProductInstructionText',
      desc: '',
      args: [],
    );
  }

  /// `Take a picture of your fridge or pantry showing all the products you want to suggest.`
  String get suggestAssortmentInstructionText {
    return Intl.message(
      'Take a picture of your fridge or pantry showing all the products you want to suggest.',
      name: 'suggestAssortmentInstructionText',
      desc: '',
      args: [],
    );
  }

  /// `Hold the camera in front of the membership barcode.`
  String get scanMembershipBarcodeExplanation {
    return Intl.message(
      'Hold the camera in front of the membership barcode.',
      name: 'scanMembershipBarcodeExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Setup contribution/fee`
  String get planContributionTitle {
    return Intl.message(
      'Setup contribution/fee',
      name: 'planContributionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Schedule your next shift or configure the bank account for your membership fee.`
  String get planContributionExplanation {
    return Intl.message(
      'Schedule your next shift or configure the bank account for your membership fee.',
      name: 'planContributionExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get propertiesTitle {
    return Intl.message(
      'Settings',
      name: 'propertiesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset app`
  String get resetAppLabel {
    return Intl.message(
      'Reset app',
      name: 'resetAppLabel',
      desc: '',
      args: [],
    );
  }

  /// `Membership`
  String get membershipSectionTitle {
    return Intl.message(
      'Membership',
      name: 'membershipSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Impact`
  String get impactSectionTitle {
    return Intl.message(
      'Impact',
      name: 'impactSectionTitle',
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
