import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/l10n/app_loc.dart';

part 'language_provider.g.dart';

@Riverpod(keepAlive: true)
class LanguageNotifier extends _$LanguageNotifier {
  @override
  Locale build() {
    return AppLoc.supportedLocale[0];
  }

  void update(Locale locale) {
    state = locale;
  }
}
