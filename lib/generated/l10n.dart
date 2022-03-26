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

  /// `Membership ID`
  String get showMembershipID {
    return Intl.message(
      'Membership ID',
      name: 'showMembershipID',
      desc: '',
      args: [],
    );
  }

  /// `Suggest Product`
  String get suggestProduct {
    return Intl.message(
      'Suggest Product',
      name: 'suggestProduct',
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
  String get membership {
    return Intl.message(
      'Membership',
      name: 'membership',
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

  /// `Hold the camera in front of the membership barcode.`
  String get scanMembershipBarcodeExplanation {
    return Intl.message(
      'Hold the camera in front of the membership barcode.',
      name: 'scanMembershipBarcodeExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming shift`
  String get upcomingShift {
    return Intl.message(
      'Upcoming shift',
      name: 'upcomingShift',
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

  /// `Community`
  String get communitySectionTitle {
    return Intl.message(
      'Community',
      name: 'communitySectionTitle',
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

  /// `We are {membershipCount} members`
  String membershipCountTitle(Object membershipCount) {
    return Intl.message(
      'We are $membershipCount members',
      name: 'membershipCountTitle',
      desc: '',
      args: [membershipCount],
    );
  }

  /// `Help grow our community by inviting your friends`
  String get membershipCountExplanation {
    return Intl.message(
      'Help grow our community by inviting your friends',
      name: 'membershipCountExplanation',
      desc: '',
      args: [],
    );
  }

  /// `We have {shopCount,plural, =0{no store}=1{one store}other{{shopCount} stores}}`
  String storeCountTitle(num shopCount) {
    return Intl.message(
      'We have ${Intl.plural(shopCount, zero: 'no store', one: 'one store', other: '$shopCount stores')}',
      name: 'storeCountTitle',
      desc: '',
      args: [shopCount],
    );
  }

  /// `Tell the world to open more cooperative supermarkets!`
  String get storeCountExplanation {
    return Intl.message(
      'Tell the world to open more cooperative supermarkets!',
      name: 'storeCountExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPasswordLabel {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please log in to continue`
  String get pleaseLogInToContinue {
    return Intl.message(
      'Please log in to continue',
      name: 'pleaseLogInToContinue',
      desc: '',
      args: [],
    );
  }

  /// `An Error Occurred`
  String get anErrorOccurred {
    return Intl.message(
      'An Error Occurred',
      name: 'anErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `No account was found matching that email and password`
  String get noAccountWasFoundMatchingThatEmailAndPassword {
    return Intl.message(
      'No account was found matching that email and password',
      name: 'noAccountWasFoundMatchingThatEmailAndPassword',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Authentication Failure`
  String get authenticationFailure {
    return Intl.message(
      'Authentication Failure',
      name: 'authenticationFailure',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load data`
  String get failedToLoadData {
    return Intl.message(
      'Failed to load data',
      name: 'failedToLoadData',
      desc: '',
      args: [],
    );
  }

  /// `Connection failed`
  String get connectionFailed {
    return Intl.message(
      'Connection failed',
      name: 'connectionFailed',
      desc: '',
      args: [],
    );
  }

  /// `invalid username`
  String get invalidUsername {
    return Intl.message(
      'invalid username',
      name: 'invalidUsername',
      desc: '',
      args: [],
    );
  }

  /// `invalid password`
  String get invalidPassword {
    return Intl.message(
      'invalid password',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Manage`
  String get manage {
    return Intl.message(
      'Manage',
      name: 'manage',
      desc: '',
      args: [],
    );
  }

  /// `No Membership`
  String get noMembership {
    return Intl.message(
      'No Membership',
      name: 'noMembership',
      desc: '',
      args: [],
    );
  }

  /// `Manage membership`
  String get manageMembership {
    return Intl.message(
      'Manage membership',
      name: 'manageMembership',
      desc: '',
      args: [],
    );
  }

  /// `Your account details`
  String get yourAccountDetails {
    return Intl.message(
      'Your account details',
      name: 'yourAccountDetails',
      desc: '',
      args: [],
    );
  }

  /// `IBAN`
  String get iban {
    return Intl.message(
      'IBAN',
      name: 'iban',
      desc: '',
      args: [],
    );
  }

  /// `Looking for stand-in`
  String get lookingForStandIn {
    return Intl.message(
      'Looking for stand-in',
      name: 'lookingForStandIn',
      desc: '',
      args: [],
    );
  }

  /// `Excused`
  String get missedExcused {
    return Intl.message(
      'Excused',
      name: 'missedExcused',
      desc: '',
      args: [],
    );
  }

  /// `Missed`
  String get missed {
    return Intl.message(
      'Missed',
      name: 'missed',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow`
  String get tomorrow {
    return Intl.message(
      'Tomorrow',
      name: 'tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `You're allowed to shop as a member.`
  String get allowedToShopAsMember {
    return Intl.message(
      'You\'re allowed to shop as a member.',
      name: 'allowedToShopAsMember',
      desc: '',
      args: [],
    );
  }

  /// `You aren't allowed to shop as a member.`
  String get notAllowedToShop {
    return Intl.message(
      'You aren\'t allowed to shop as a member.',
      name: 'notAllowedToShop',
      desc: '',
      args: [],
    );
  }

  /// `No upcoming shift`
  String get noUpcomingShift {
    return Intl.message(
      'No upcoming shift',
      name: 'noUpcomingShift',
      desc: '',
      args: [],
    );
  }

  /// `You've taken over {shareCount,plural, =0{no shares}=1{one share}other{{shareCount} shares}}.`
  String shareCountInfo(num shareCount) {
    return Intl.message(
      'You\'ve taken over ${Intl.plural(shareCount, zero: 'no shares', one: 'one share', other: '$shareCount shares')}.',
      name: 'shareCountInfo',
      desc: '',
      args: [shareCount],
    );
  }

  /// `In order to support the cooperative, you may take over more shares or grant the cooperative a loan.`
  String get takeOverMoreSharesMessage {
    return Intl.message(
      'In order to support the cooperative, you may take over more shares or grant the cooperative a loan.',
      name: 'takeOverMoreSharesMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cooperative shares`
  String get cooperativeSharesHeadline {
    return Intl.message(
      'Cooperative shares',
      name: 'cooperativeSharesHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Apply for membership`
  String get applyForMembershipLabel {
    return Intl.message(
      'Apply for membership',
      name: 'applyForMembershipLabel',
      desc: '',
      args: [],
    );
  }

  /// `Training`
  String get training {
    return Intl.message(
      'Training',
      name: 'training',
      desc: '',
      args: [],
    );
  }

  /// `Take Training`
  String get takeTraining {
    return Intl.message(
      'Take Training',
      name: 'takeTraining',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load impact info`
  String get failedToLoadImpactInfoMessage {
    return Intl.message(
      'Failed to load impact info',
      name: 'failedToLoadImpactInfoMessage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load recipes`
  String get failedToLoadRecipesMessage {
    return Intl.message(
      'Failed to load recipes',
      name: 'failedToLoadRecipesMessage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load training content`
  String get failedToLoadTrainingContentMessage {
    return Intl.message(
      'Failed to load training content',
      name: 'failedToLoadTrainingContentMessage',
      desc: '',
      args: [],
    );
  }

  /// `Recipes`
  String get recipes {
    return Intl.message(
      'Recipes',
      name: 'recipes',
      desc: '',
      args: [],
    );
  }

  /// `No recipes in your language found.`
  String get noRecipesInYourLanguageFound {
    return Intl.message(
      'No recipes in your language found.',
      name: 'noRecipesInYourLanguageFound',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueLabel {
    return Intl.message(
      'Continue',
      name: 'continueLabel',
      desc: '',
      args: [],
    );
  }

  /// `No bank account set up`
  String get sepaAccountMissing {
    return Intl.message(
      'No bank account set up',
      name: 'sepaAccountMissing',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructions {
    return Intl.message(
      'Instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get ingredients {
    return Intl.message(
      'Ingredients',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `Submit suggestion`
  String get submitSuggestion {
    return Intl.message(
      'Submit suggestion',
      name: 'submitSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Failed to initialize camera`
  String get failedToInitializeCamera {
    return Intl.message(
      'Failed to initialize camera',
      name: 'failedToInitializeCamera',
      desc: '',
      args: [],
    );
  }

  /// `View licenses`
  String get viewLicenses {
    return Intl.message(
      'View licenses',
      name: 'viewLicenses',
      desc: '',
      args: [],
    );
  }

  /// `Licences`
  String get licences {
    return Intl.message(
      'Licences',
      name: 'licences',
      desc: '',
      args: [],
    );
  }

  /// `Change Account`
  String get changeAccount {
    return Intl.message(
      'Change Account',
      name: 'changeAccount',
      desc: '',
      args: [],
    );
  }

  /// `Badge`
  String get badge {
    return Intl.message(
      'Badge',
      name: 'badge',
      desc: '',
      args: [],
    );
  }

  /// `Shifts that need support`
  String get shiftsThatNeedSupport {
    return Intl.message(
      'Shifts that need support',
      name: 'shiftsThatNeedSupport',
      desc: '',
      args: [],
    );
  }

  /// `Your upcoming shift`
  String get yourUpcomingShift {
    return Intl.message(
      'Your upcoming shift',
      name: 'yourUpcomingShift',
      desc: '',
      args: [],
    );
  }

  /// `Partners`
  String get partners {
    return Intl.message(
      'Partners',
      name: 'partners',
      desc: '',
      args: [],
    );
  }

  /// `Supermarket`
  String get supermarket {
    return Intl.message(
      'Supermarket',
      name: 'supermarket',
      desc: '',
      args: [],
    );
  }

  /// `Untitled`
  String get untitled {
    return Intl.message(
      'Untitled',
      name: 'untitled',
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
