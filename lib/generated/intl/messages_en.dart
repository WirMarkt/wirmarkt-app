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

  static String m1(shareCount) =>
      "You\'ve taken over ${Intl.plural(shareCount, zero: 'no shares', one: 'one share', other: '${shareCount} shares')}.";

  static String m2(shopCount) =>
      "We have ${Intl.plural(shopCount, zero: 'no store', one: 'one store', other: '${shopCount} stores')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alignWithBarcodeExplanation": MessageLookupByLibrary.simpleMessage(
            "Hold the barcode in front of the camera so that it can be seen in its entirety."),
        "allowedToShopAsMember": MessageLookupByLibrary.simpleMessage(
            "You\'re allowed to shop as a member."),
        "anErrorOccurred":
            MessageLookupByLibrary.simpleMessage("An Error Occurred"),
        "applyForMembershipLabel":
            MessageLookupByLibrary.simpleMessage("Apply for membership"),
        "authenticationFailure":
            MessageLookupByLibrary.simpleMessage("Authentication Failure"),
        "badge": MessageLookupByLibrary.simpleMessage("Badge"),
        "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
        "changeAccount": MessageLookupByLibrary.simpleMessage("Change Account"),
        "connectionFailed":
            MessageLookupByLibrary.simpleMessage("Connection failed"),
        "continueLabel": MessageLookupByLibrary.simpleMessage("Continue"),
        "cooperativeSharesHeadline":
            MessageLookupByLibrary.simpleMessage("Cooperative shares"),
        "done": MessageLookupByLibrary.simpleMessage("Done"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "failedToInitializeCamera":
            MessageLookupByLibrary.simpleMessage("Failed to initialize camera"),
        "failedToLoadImpactInfoMessage":
            MessageLookupByLibrary.simpleMessage("Failed to load impact info"),
        "failedToLoadMembershipInfo": MessageLookupByLibrary.simpleMessage(
            "Failed to load membership info"),
        "failedToLoadRecipesMessage":
            MessageLookupByLibrary.simpleMessage("Failed to load recipes"),
        "failedToLoadTrainingContentMessage":
            MessageLookupByLibrary.simpleMessage(
                "Failed to load training content"),
        "forgotPasswordLabel":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "iban": MessageLookupByLibrary.simpleMessage("IBAN"),
        "impactSectionTitle": MessageLookupByLibrary.simpleMessage("Impact"),
        "ingredients": MessageLookupByLibrary.simpleMessage("Ingredients"),
        "instructions": MessageLookupByLibrary.simpleMessage("Instructions"),
        "introTitle": MessageLookupByLibrary.simpleMessage("Story"),
        "invalidPassword":
            MessageLookupByLibrary.simpleMessage("invalid password"),
        "invalidUsername":
            MessageLookupByLibrary.simpleMessage("invalid username"),
        "licences": MessageLookupByLibrary.simpleMessage("Licences"),
        "loadingImpactMessage":
            MessageLookupByLibrary.simpleMessage("Loading impact"),
        "loadingMembershipInfo":
            MessageLookupByLibrary.simpleMessage("Loading membership..."),
        "loadingRecipesMessage":
            MessageLookupByLibrary.simpleMessage("Loading recipes"),
        "loadingTrainingMessage":
            MessageLookupByLibrary.simpleMessage("Loading training"),
        "logIn": MessageLookupByLibrary.simpleMessage("Log In"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
        "lookingForStandIn":
            MessageLookupByLibrary.simpleMessage("Looking for stand-in"),
        "manage": MessageLookupByLibrary.simpleMessage("Manage"),
        "manageMembership":
            MessageLookupByLibrary.simpleMessage("Manage membership"),
        "memberLabel": MessageLookupByLibrary.simpleMessage("Member"),
        "membership": MessageLookupByLibrary.simpleMessage("Membership"),
        "membershipCountExplanation": MessageLookupByLibrary.simpleMessage(
            "Help grow our community by inviting your friends"),
        "membershipCountTitle": m0,
        "membershipSectionTitle":
            MessageLookupByLibrary.simpleMessage("Membership"),
        "missed": MessageLookupByLibrary.simpleMessage("Missed"),
        "missedExcused": MessageLookupByLibrary.simpleMessage("Excused"),
        "noAccountWasFoundMatchingThatEmailAndPassword":
            MessageLookupByLibrary.simpleMessage(
                "No account was found matching that email and password"),
        "noMembership": MessageLookupByLibrary.simpleMessage("No Membership"),
        "noRecipesInYourLanguageFound": MessageLookupByLibrary.simpleMessage(
            "No recipes in your language found."),
        "noUpcomingShift":
            MessageLookupByLibrary.simpleMessage("No upcoming shift"),
        "notAllowedToShop": MessageLookupByLibrary.simpleMessage(
            "You aren\'t allowed to shop as a member."),
        "notes": MessageLookupByLibrary.simpleMessage("Notes"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "pending": MessageLookupByLibrary.simpleMessage("Pending"),
        "pleaseLogInToContinue":
            MessageLookupByLibrary.simpleMessage("Please log in to continue"),
        "propertiesTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "rawContentLabel": MessageLookupByLibrary.simpleMessage("Raw Content"),
        "recipes": MessageLookupByLibrary.simpleMessage("Recipes"),
        "resetAppLabel": MessageLookupByLibrary.simpleMessage("Reset app"),
        "resultLabel": MessageLookupByLibrary.simpleMessage("Result"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "scanBarCodeTitle":
            MessageLookupByLibrary.simpleMessage("Scan barcode"),
        "scanMembershipBarcodeExplanation":
            MessageLookupByLibrary.simpleMessage(
                "Hold the camera in front of the membership barcode."),
        "scanResultTitle": MessageLookupByLibrary.simpleMessage("Scan Result"),
        "sepaAccountMissing":
            MessageLookupByLibrary.simpleMessage("No bank account set up"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "shareCountInfo": m1,
        "showBarcodeAtPOSLabel": MessageLookupByLibrary.simpleMessage(
            "Show this barcode at the checkout in the store."),
        "showMembershipID":
            MessageLookupByLibrary.simpleMessage("Membership ID"),
        "storeCountExplanation": MessageLookupByLibrary.simpleMessage(
            "Tell the world to open more cooperative supermarkets!"),
        "storeCountTitle": m2,
        "submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "submitSuggestion":
            MessageLookupByLibrary.simpleMessage("Submit suggestion"),
        "suggestProduct":
            MessageLookupByLibrary.simpleMessage("Suggest Product"),
        "suggestProductInstructionText": MessageLookupByLibrary.simpleMessage(
            "Take a photo of the product you want to suggest."),
        "takeOverMoreSharesMessage": MessageLookupByLibrary.simpleMessage(
            "In order to support the cooperative, you may take over more shares or grant the cooperative a loan."),
        "takeTraining": MessageLookupByLibrary.simpleMessage("Take Training"),
        "today": MessageLookupByLibrary.simpleMessage("Today"),
        "tomorrow": MessageLookupByLibrary.simpleMessage("Tomorrow"),
        "training": MessageLookupByLibrary.simpleMessage("Training"),
        "upcomingShift": MessageLookupByLibrary.simpleMessage("Upcoming shift"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "viewLicenses": MessageLookupByLibrary.simpleMessage("View licenses"),
        "yourAccountDetails":
            MessageLookupByLibrary.simpleMessage("Your account details")
      };
}
