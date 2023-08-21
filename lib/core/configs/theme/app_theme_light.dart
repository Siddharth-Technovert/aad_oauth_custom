import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/styles/colors/ui_colors_light.dart';
import '../../utils/styles/text_styles/ui_text_styles.dart';
import '../../utils/styles/text_styles/ui_text_styles_light.dart';

abstract class AppThemeLight {
  static ThemeData get theme {
    final colors = UIColorsLight();
    final textStylesLight = UITextStylesLight();

    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        primaryContainer: colors.primaryContainer,
        onPrimaryContainer: colors.onPrimaryContainer,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        secondaryContainer: colors.secondaryContainer,
        onSecondaryContainer: colors.onSecondaryContainer,
        tertiary: colors.tertiary,
        onTertiary: colors.onTertiary,
        tertiaryContainer: colors.tertiaryContainer,
        onTertiaryContainer: colors.onTertiaryContainer,
        error: colors.error,
        onError: colors.onError,
        errorContainer: colors.errorContainer,
        onErrorContainer: colors.onErrorContainer,
        background: colors.background,
        onBackground: colors.onBackground,
        surface: colors.surface,
        onSurface: colors.onSurface,
        surfaceVariant: colors.surfaceVariant,
        onSurfaceVariant: colors.onSurfaceVariant,
        outline: colors.outline,
        outlineVariant: colors.outlineVariant,
        shadow: colors.shadow,
        scrim: colors.scrim,
        inverseSurface: colors.inverseSurface,
        onInverseSurface: colors.onInverseSurface,
        inversePrimary: colors.inversePrimary,
        surfaceTint: colors.surfaceTint,
      ),
      //?Theme Extensions
      extensions: [
        colors.customColors,
      ],
      //?Shapes Theme
      appBarTheme: const AppBarTheme(
        // color: UIColors.light.background,
        // iconTheme: IconThemeData(color: UIColors.light.icon),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          // statusBarColor: UIColors.light.background,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      // iconTheme: const IconThemeData(
      //     // color: UIColors.light.icon,
      //     ),
      // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //     // backgroundColor: UIColors.light.bottomNavBgColor,
      //     // selectedItemColor: UIColors.light.bottomNavSelectedItem,
      //     // unselectedItemColor: UIColors.light.bottomNavUnSelectedItem,
      //     ),
      // bottomSheetTheme: const BottomSheetThemeData(
      //     // backgroundColor: UIColors.light.scaffoldBackground,
      //     ),
      // switchTheme: const SwitchThemeData(
      //     // thumbColor: MaterialStateProperty.all<Color>(
      //     //   UIColors.light.primary,
      //     // ),
      //     // trackColor: MaterialStateProperty.all<Color>(
      //     //   UIColors.light.switchActiveTrackColor.withOpacity(0.5),
      //     // ),
      //     ),
      //?Typography
      typography:
          Typography.material2021(colorScheme: const ColorScheme.dark()),
      textTheme: TextTheme(
        displayLarge: textStylesLight.displayLarge,
        displayMedium: textStylesLight.displayMedium,
        displaySmall: textStylesLight.displaySmall,
        headlineLarge: textStylesLight.headlineLarge,
        headlineMedium: textStylesLight.headlineMedium,
        headlineSmall: textStylesLight.headlineSmall,
        titleLarge: textStylesLight.titleLarge,
        titleMedium: textStylesLight.titleMedium,
        titleSmall: textStylesLight.titleSmall,
        bodyLarge: textStylesLight.bodyLarge,
        bodyMedium: textStylesLight.bodyMedium,
        bodySmall: textStylesLight.bodySmall,
        labelLarge: textStylesLight.labelLarge,
        labelMedium: textStylesLight.labelMedium,
        labelSmall: textStylesLight.labelSmall,
      ).apply(fontFamily: fontFamily),
      // textSelectionTheme: const TextSelectionThemeData(
      //     // selectionColor: UIColors.light.textSelection,
      //     ),
      // textButtonTheme: const TextButtonThemeData(
      //   style: ButtonStyle(
      //       // backgroundColor: UIColors.light.button,
      //       ),
      // ),
    );
  }
}
