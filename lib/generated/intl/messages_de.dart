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

  static String m1(shareCount) =>
      "Du hast ${Intl.plural(shareCount, zero: 'keine Anteile', one: 'einen Anteil', other: '${shareCount} Anteile')} übernommen.";

  static String m2(shopCount) =>
      "Wir haben ${Intl.plural(shopCount, zero: 'kein Geschäft', one: 'ein Geschäft', other: '${shopCount} Geschäfte')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alignWithBarcodeExplanation": MessageLookupByLibrary.simpleMessage(
            "Barcode so vor die Kamera halten, dass er komplett zu sehen ist."),
        "allowedToShopAsMember": MessageLookupByLibrary.simpleMessage(
            "Du kannst als Mitglied im Laden einkaufen"),
        "anErrorOccurred":
            MessageLookupByLibrary.simpleMessage("Ein Fehler ist aufgetreten"),
        "applyForMembershipLabel":
            MessageLookupByLibrary.simpleMessage("Als Mitglied bewerben"),
        "authenticationFailure": MessageLookupByLibrary.simpleMessage(
            "Nutzername oder Passwort falsch"),
        "badge": MessageLookupByLibrary.simpleMessage("Ausweis"),
        "cancelled": MessageLookupByLibrary.simpleMessage("Abgesagt"),
        "changeAccount": MessageLookupByLibrary.simpleMessage("Konto wechseln"),
        "connectionFailed":
            MessageLookupByLibrary.simpleMessage("Verbindung fehlgeschlagen"),
        "continueLabel": MessageLookupByLibrary.simpleMessage("Continue"),
        "cooperativeSharesHeadline": MessageLookupByLibrary.simpleMessage(
            "Anteile an der Genossenschaft"),
        "done": MessageLookupByLibrary.simpleMessage("Erledigt"),
        "email": MessageLookupByLibrary.simpleMessage("E-Mail"),
        "failedToInitializeCamera": MessageLookupByLibrary.simpleMessage(
            "Konnte Kamera nicht initialisieren"),
        "failedToLoadImpactInfoMessage": MessageLookupByLibrary.simpleMessage(
            "Impact-Infos konnten nicht geladen werden"),
        "failedToLoadMembershipInfo": MessageLookupByLibrary.simpleMessage(
            "Konnte Mitgliedschaft nicht laden"),
        "failedToLoadRecipesMessage": MessageLookupByLibrary.simpleMessage(
            "Rezepte konnten nicht geladen werden"),
        "failedToLoadTrainingContentMessage":
            MessageLookupByLibrary.simpleMessage(
                "Schulungsinhalte konnten nicht geladen werden"),
        "forgotPasswordLabel":
            MessageLookupByLibrary.simpleMessage("Passwort vergessen?"),
        "iban": MessageLookupByLibrary.simpleMessage("IBAN"),
        "impactSectionTitle": MessageLookupByLibrary.simpleMessage("Impact"),
        "ingredients": MessageLookupByLibrary.simpleMessage("Zutaten"),
        "instructions": MessageLookupByLibrary.simpleMessage("Anleitung"),
        "introTitle": MessageLookupByLibrary.simpleMessage("Story"),
        "invalidPassword":
            MessageLookupByLibrary.simpleMessage("Ungültiges Passwort"),
        "invalidUsername":
            MessageLookupByLibrary.simpleMessage("Ungültiger Benutzername"),
        "licences": MessageLookupByLibrary.simpleMessage("Lizenzen"),
        "loadingImpactMessage":
            MessageLookupByLibrary.simpleMessage("Lade Impact-Infos"),
        "loadingMembershipInfo":
            MessageLookupByLibrary.simpleMessage("Lade Mitgliedschaft..."),
        "loadingRecipesMessage":
            MessageLookupByLibrary.simpleMessage("Lade Rezepte"),
        "loadingTrainingMessage":
            MessageLookupByLibrary.simpleMessage("Lade Schulung"),
        "logIn": MessageLookupByLibrary.simpleMessage("Anmelden"),
        "logOut": MessageLookupByLibrary.simpleMessage("Abmelden"),
        "lookingForStandIn":
            MessageLookupByLibrary.simpleMessage("Sucht Vertretung"),
        "manage": MessageLookupByLibrary.simpleMessage("Manage"),
        "manageMembership":
            MessageLookupByLibrary.simpleMessage("Mitgliedschaft verwalten"),
        "memberLabel": MessageLookupByLibrary.simpleMessage("Mitgliedschaft"),
        "membership": MessageLookupByLibrary.simpleMessage("Mitgliedschaft"),
        "membershipCountExplanation": MessageLookupByLibrary.simpleMessage(
            "Hilf mit und lade deine Freunde ein"),
        "membershipCountTitle": m0,
        "membershipSectionTitle":
            MessageLookupByLibrary.simpleMessage("Mitgliedschaft"),
        "missed": MessageLookupByLibrary.simpleMessage("Nicht erschienen"),
        "missedExcused": MessageLookupByLibrary.simpleMessage("Entschuldigt"),
        "noAccountWasFoundMatchingThatEmailAndPassword":
            MessageLookupByLibrary.simpleMessage(
                "Kein Konto wurde gefunden mit der E-Mail-Adresse und dem Passwort"),
        "noMembership":
            MessageLookupByLibrary.simpleMessage("Keine Mitgliedschaft"),
        "noRecipesInYourLanguageFound": MessageLookupByLibrary.simpleMessage(
            "Keine Rezepte in deiner Sprache gefunden."),
        "noUpcomingShift":
            MessageLookupByLibrary.simpleMessage("Keine Schicht geplant"),
        "notAllowedToShop": MessageLookupByLibrary.simpleMessage(
            "Derzeit kannst du nicht im Laden einkaufen."),
        "notes": MessageLookupByLibrary.simpleMessage("Notizen"),
        "password": MessageLookupByLibrary.simpleMessage("Passwort"),
        "pending": MessageLookupByLibrary.simpleMessage("Ausstehend"),
        "pleaseLogInToContinue": MessageLookupByLibrary.simpleMessage(
            "Bitte melde dich an um fortzufahren"),
        "propertiesTitle":
            MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "rawContentLabel": MessageLookupByLibrary.simpleMessage("Roher Inhalt"),
        "recipes": MessageLookupByLibrary.simpleMessage("Rezepte"),
        "resetAppLabel":
            MessageLookupByLibrary.simpleMessage("App zurücksetzen"),
        "resultLabel": MessageLookupByLibrary.simpleMessage("Resultat"),
        "retry": MessageLookupByLibrary.simpleMessage("Erneut versuchen"),
        "scanBarCodeTitle":
            MessageLookupByLibrary.simpleMessage("Barcode scannen"),
        "scanMembershipBarcodeExplanation":
            MessageLookupByLibrary.simpleMessage(
                "Halte die Kamera vor den Mitglieder-Barcode."),
        "scanResultTitle":
            MessageLookupByLibrary.simpleMessage("Scan Resultat"),
        "sepaAccountMissing":
            MessageLookupByLibrary.simpleMessage("Keine Kontodaten hinterlegt"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "shareCountInfo": m1,
        "shiftsThatNeedSupport": MessageLookupByLibrary.simpleMessage(
            "Schichten die Unterstützung benötigen"),
        "showBarcodeAtPOSLabel": MessageLookupByLibrary.simpleMessage(
            "Zeige diesen Barcode an der Kasse im Laden."),
        "showMembershipID":
            MessageLookupByLibrary.simpleMessage("Mitgliedsausweis"),
        "storeCountExplanation": MessageLookupByLibrary.simpleMessage(
            "Sagt der Welt, sie soll mehr genossenschaftliche Supermärkte eröffnen!"),
        "storeCountTitle": m2,
        "submit": MessageLookupByLibrary.simpleMessage("Absenden"),
        "submitSuggestion":
            MessageLookupByLibrary.simpleMessage("Vorschlag absenden"),
        "suggestProduct":
            MessageLookupByLibrary.simpleMessage("Produkt vorschlagen"),
        "suggestProductInstructionText": MessageLookupByLibrary.simpleMessage(
            "Mache ein Foto von dem Produkt, das du vorschlagen möchtest."),
        "takeOverMoreSharesMessage": MessageLookupByLibrary.simpleMessage(
            "Um die Genossenschaft zu unterstützen, kannst du weitere Anteile zeichnen oder der Genossenschaft ein Darlehen geben."),
        "takeTraining": MessageLookupByLibrary.simpleMessage("Schulung machen"),
        "today": MessageLookupByLibrary.simpleMessage("Heute"),
        "tomorrow": MessageLookupByLibrary.simpleMessage("Morgen"),
        "training": MessageLookupByLibrary.simpleMessage("Schulung"),
        "upcomingShift":
            MessageLookupByLibrary.simpleMessage("Nächste Schicht"),
        "username": MessageLookupByLibrary.simpleMessage("Benutzername"),
        "viewLicenses":
            MessageLookupByLibrary.simpleMessage("Lizenzen ansehen"),
        "yourAccountDetails":
            MessageLookupByLibrary.simpleMessage("Deine Kontodaten"),
        "yourUpcomingShift":
            MessageLookupByLibrary.simpleMessage("Deine nächste Schicht")
      };
}
