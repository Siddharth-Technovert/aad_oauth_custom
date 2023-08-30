import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/l10n/app_loc.dart';

final localLanguageProvider = StateProvider<Locale>((ref) {
  return AppLoc.supportedLocale[0];
});
