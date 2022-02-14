import 'package:intl/intl.dart';

mixin HasTranslations<T extends HasTranslation> {
  List<T> get translations;

  bool hasTranslationForLocale([String? locale]) {
    var canonLanguageName =
        Intl.canonicalizedLocale(locale ?? Intl.getCurrentLocale());
    return translations
        .any((element) => element.languageName.startsWith(canonLanguageName));
  }

  /// get translation for [locale] or current locale if [locale] omitted
  T getTranslationForLocale([String? locale]) =>
      getTranslationForLocaleOrNull(locale)!;

  /// get translation for [locale] or current locale if [locale] omitted
  T? getTranslationForLocaleOrNull([String? locale]) {
    var canonLanguageName =
        Intl.canonicalizedLocale(locale ?? Intl.getCurrentLocale());
    var matches = translations
        .where((element) => element.languageName.startsWith(canonLanguageName));
    if (matches.length == 1) {
      return matches.first;
    } else {
      return null;
    }
  }
}

mixin HasTranslation {
  String get languageName;
}
