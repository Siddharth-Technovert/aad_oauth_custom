import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLoc {
  const AppLoc._();

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context);
  }

  static const supportedLocale = AppLocalizations.supportedLocales;

  static const delegates = AppLocalizations.localizationsDelegates;
}

//TODO: update this whenever you add new language
extension LanguageNameExtension on Locale {
  String get languageName => switch (languageCode) {
        "en" => "English",
        "hi" => "Hindi",
        _ => "",
      };
}
