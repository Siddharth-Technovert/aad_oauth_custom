// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLoc {
  const AppLoc._();

  static AppLocalizations of(BuildContext context) {
    if (AppLocalizations.of(context) != null) {
      return AppLocalizations.of(context)!;
    } else {
      throw AppLocException();
    }
  }

  static const supportedLocale = AppLocalizations.supportedLocales;

  static const delegates = AppLocalizations.localizationsDelegates;
}

class AppLocException implements Exception {
  @override
  String toString() {
    return "AppLocalization is either null or some error occurred";
  }
}
