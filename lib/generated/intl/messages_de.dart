// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(membershipCount) => "Wir sind ${membershipCount} Mitglieder";

  static String m1(shopCount) =>
      "Wir haben ${Intl.plural(shopCount, zero: 'kein Geschäft', one: 'ein Geschäft', other: '${shopCount} Geschäfte')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alignWithBarcodeExplanation": MessageLookupByLibrary.simpleMessage(
            "Barcode so vor die Kamera halten, dass er komplett zu sehen ist."),
        "anErrorOccurred":
            MessageLookupByLibrary.simpleMessage("Ein Fehler ist aufgetreten"),
        "authenticationFailure":
            MessageLookupByLibrary.simpleMessage("Authentication Failure"),
        "connectionFailed":
            MessageLookupByLibrary.simpleMessage("Connection failed"),
        "createAssortmentSuggestionExplanation":
            MessageLookupByLibrary.simpleMessage(
                "Mehrere Produkte auf einmal vorschlagen."),
        "createAssortmentSuggestionTitle":
            MessageLookupByLibrary.simpleMessage("Neuer Sortimentswunsch"),
        "createProductSuggestionExplanation":
            MessageLookupByLibrary.simpleMessage(
                "Einzelnes Produkt vorschlagen."),
        "createProductSuggestionTitle":
            MessageLookupByLibrary.simpleMessage("Neuer Produktwunsch"),
        "email": MessageLookupByLibrary.simpleMessage("E-Mail"),
        "failedToLoadMembershipInfo": MessageLookupByLibrary.simpleMessage(
            "Failed to load membership info."),
        "forgotPasswordLabel":
            MessageLookupByLibrary.simpleMessage("Passwort vergessen?"),
        "impactSectionTitle": MessageLookupByLibrary.simpleMessage("Impact"),
        "introTitle": MessageLookupByLibrary.simpleMessage("Story"),
        "loadingMembershipInfo":
            MessageLookupByLibrary.simpleMessage("Loading membership info"),
        "logIn": MessageLookupByLibrary.simpleMessage("Anmelden"),
        "logOut": MessageLookupByLibrary.simpleMessage("Abmelden"),
        "memberLabel": MessageLookupByLibrary.simpleMessage("Mitgliedschaft"),
        "membershipCountExplanation": MessageLookupByLibrary.simpleMessage(
            "Hilf mit und lade deine Freunde ein"),
        "membershipCountTitle": m0,
        "membershipSectionTitle":
            MessageLookupByLibrary.simpleMessage("Mitgliedschaft"),
        "membershipTitle":
            MessageLookupByLibrary.simpleMessage("Mitgliedschaft"),
        "noAccountWasFoundMatchingThatEmailAndPassword":
            MessageLookupByLibrary.simpleMessage(
                "Kein Konto wurde gefunden mit der E-Mail-Adresse und dem Passwort"),
        "password": MessageLookupByLibrary.simpleMessage("Passwort"),
        "planContributionExplanation": MessageLookupByLibrary.simpleMessage(
            "Plane deine nächste Schicht oder konfiguriere das Bankkonto für deinen Beitrag"),
        "planContributionTitle":
            MessageLookupByLibrary.simpleMessage("Mitarbeit/Beitrag planen"),
        "pleaseLogInToContinue": MessageLookupByLibrary.simpleMessage(
            "Bitte melde dich an um fortzufahren"),
        "propertiesTitle":
            MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "rawContentLabel": MessageLookupByLibrary.simpleMessage("Roher Inhalt"),
        "regionalwertPartnerExplanation": MessageLookupByLibrary.simpleMessage(
            "Wir setzen uns gemeinsam ein für ökologische, regionale und sozial produzierte Lebensmittel."),
        "regionalwertPartnerTitle":
            MessageLookupByLibrary.simpleMessage("Regionalwert-Partner"),
        "resetAppLabel":
            MessageLookupByLibrary.simpleMessage("App zurücksetzen"),
        "resultLabel": MessageLookupByLibrary.simpleMessage("Resultat"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "scanBarCodeTitle":
            MessageLookupByLibrary.simpleMessage("Barcode scannen"),
        "scanMembershipBarcodeExplanation":
            MessageLookupByLibrary.simpleMessage(
                "Halte die Kamera vor den Mitglieder-Barcode."),
        "scanResultTitle":
            MessageLookupByLibrary.simpleMessage("Scan Resultat"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "setupMembershipExplanation":
            MessageLookupByLibrary.simpleMessage("Ausweis im Smartphone."),
        "setupMembershipTitle":
            MessageLookupByLibrary.simpleMessage("Mitgliedsausweis einrichten"),
        "shopAsMemberTitle":
            MessageLookupByLibrary.simpleMessage("Als Mitglied einkaufen"),
        "showBarcodeAtPOSLabel": MessageLookupByLibrary.simpleMessage(
            "Zeige diesen Barcode an der Kasse im Laden."),
        "storeCountExplanation": MessageLookupByLibrary.simpleMessage(
            "Sagt der Welt, sie soll mehr genossenschaftliche Supermärkte eröffnen!"),
        "storeCountTitle": m1,
        "suggestAssortmentInstructionText": MessageLookupByLibrary.simpleMessage(
            "Mache ein Foto von deinem Kühlschrank oder deiner Vorratskammer, auf dem alle Produkte zu sehen sind, die du vorschlagen möchtest."),
        "suggestProductInstructionText": MessageLookupByLibrary.simpleMessage(
            "Mache ein Foto von dem Produkt, das du vorschlagen möchtest.")
      };
}
