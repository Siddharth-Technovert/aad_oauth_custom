import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/styles/colors/colors.dart';
import '../../utils/styles/text_styles/text_styles.dart';

part 'app_theme_dark.dart';
part 'app_theme_light.dart';

class AppTheme {
  static AppThemeLight get light => const AppThemeLight();
  static AppThemeDark get dark => const AppThemeDark();
}
