import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final localLanguageProvider = StateProvider<Locale>((ref) {
  return const Locale('en');
});
