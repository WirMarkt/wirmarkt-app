// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(membershipCount) => "We are ${membershipCount} members";

  static String m1(shopCount) =>
      "We have ${Intl.plural(shopCount, zero: 'no store', one: 'one store', other: '${shopCount} stores')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alignWithBarcodeExplanation": MessageLookupByLibrary.simpleMessage(
            "Hold the barcode in front of the camera so that it can be seen in its entirety."),
        "anErrorOccurred":
            MessageLookupByLibrary.simpleMessage("An Error Occurred"),
        "authenticationFailure":
            MessageLookupByLibrary.simpleMessage("Authentication Failure"),
        "createAssortmentSuggestionExplanation":
            MessageLookupByLibrary.simpleMessage(
                "Suggest multiple products at once."),
        "createAssortmentSuggestionTitle":
            MessageLookupByLibrary.simpleMessage("Suggest Assortment"),
        "createProductSuggestionExplanation":
            MessageLookupByLibrary.simpleMessage("Suggest single product."),
        "createProductSuggestionTitle":
            MessageLookupByLibrary.simpleMessage("Suggest Product"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "failedToLoadMembershipInfo": MessageLookupByLibrary.simpleMessage(
            "Failed to load membership info."),
        "forgotPasswordLabel":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "impactSectionTitle": MessageLookupByLibrary.simpleMessage("Impact"),
        "introTitle": MessageLookupByLibrary.simpleMessage("Story"),
        "loadingMembershipInfo":
            MessageLookupByLibrary.simpleMessage("Loading membership info"),
        "logIn": MessageLookupByLibrary.simpleMessage("Log In"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
        "memberLabel": MessageLookupByLibrary.simpleMessage("Member"),
        "membershipCountExplanation": MessageLookupByLibrary.simpleMessage(
            "Help grow our community by inviting your friends"),
        "membershipCountTitle": m0,
        "membershipSectionTitle":
            MessageLookupByLibrary.simpleMessage("Membership"),
        "membershipTitle": MessageLookupByLibrary.simpleMessage("Membership"),
        "noAccountWasFoundMatchingThatEmailAndPassword":
            MessageLookupByLibrary.simpleMessage(
                "No account was found matching that email and password"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "planContributionExplanation": MessageLookupByLibrary.simpleMessage(
            "Schedule your next shift or configure the bank account for your membership fee."),
        "planContributionTitle":
            MessageLookupByLibrary.simpleMessage("Setup contribution/fee"),
        "pleaseLogInToContinue":
            MessageLookupByLibrary.simpleMessage("Please log in to continue"),
        "propertiesTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "rawContentLabel": MessageLookupByLibrary.simpleMessage("Raw Content"),
        "regionalwertPartnerExplanation": MessageLookupByLibrary.simpleMessage(
            "We are committed to ecological, regional and socially produced food."),
        "regionalwertPartnerTitle":
            MessageLookupByLibrary.simpleMessage("Regionalwert-Partner"),
        "resetAppLabel": MessageLookupByLibrary.simpleMessage("Reset app"),
        "resultLabel": MessageLookupByLibrary.simpleMessage("Result"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "scanBarCodeTitle":
            MessageLookupByLibrary.simpleMessage("Scan barcode"),
        "scanMembershipBarcodeExplanation":
            MessageLookupByLibrary.simpleMessage(
                "Hold the camera in front of the membership barcode."),
        "scanResultTitle": MessageLookupByLibrary.simpleMessage("Scan Result"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "setupMembershipExplanation":
            MessageLookupByLibrary.simpleMessage("Store badge in smartphone."),
        "setupMembershipTitle":
            MessageLookupByLibrary.simpleMessage("Setup Membership"),
        "shopAsMemberTitle":
            MessageLookupByLibrary.simpleMessage("Shop as a Member"),
        "showBarcodeAtPOSLabel": MessageLookupByLibrary.simpleMessage(
            "Show this barcode at the checkout in the store."),
        "storeCountExplanation": MessageLookupByLibrary.simpleMessage(
            "Tell the world to open more cooperative supermarkets!"),
        "storeCountTitle": m1,
        "suggestAssortmentInstructionText": MessageLookupByLibrary.simpleMessage(
            "Take a picture of your fridge or pantry showing all the products you want to suggest."),
        "suggestProductInstructionText": MessageLookupByLibrary.simpleMessage(
            "Take a photo of the product you want to suggest.")
      };
}
