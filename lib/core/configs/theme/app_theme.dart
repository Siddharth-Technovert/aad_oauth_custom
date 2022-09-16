import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/styles/colors/colors.dart';
import '../../utils/styles/text_styles/text_styles.dart';

part 'app_theme_dark.dart';
part 'app_theme_light.dart';

class AppTheme {
  static _AppThemeLight get light => const _AppThemeLight();
  static _AppThemeDark get dark => const _AppThemeDark();
}
