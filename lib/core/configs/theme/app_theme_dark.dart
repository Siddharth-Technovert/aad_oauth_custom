import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/assets_gen/fonts.gen.dart';
import '../../utils/styles/colors/ui_colors_dark.dart';
import '../../utils/styles/dimensions/ui_dimensions.dart';
import '../../utils/styles/text_styles/ui_text_styles_dark.dart';

abstract class AppThemeDark {
  static ThemeData get theme {
    final colors = UIColorsDark();
    final textStylesDark = UITextStylesDark();

    return ThemeData(
      useMaterial3: true,
      fontFamily: FontFamily.poppins,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
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
        // color: UIColors.dark.background,
        // iconTheme: IconThemeData(color: UIColors.dark.icon),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          // statusBarColor: UIColors.dark.background,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      iconTheme: IconThemeData(
        size: UIDimensions.icon24,
        // color: UIColors.dark.icon,
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: UIDimensions.height(80),
      ),
      // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //     // backgroundColor: UIColors.dark.bottomNavBgColor,
      //     // selectedItemColor: UIColors.dark.bottomNavSelectedItem,
      //     // unselectedItemColor: UIColors.dark.bottomNavUnSelectedItem,
      //     ),
      // bottomSheetTheme: const BottomSheetThemeData(
      //     // backgroundColor: UIColors.dark.scaffoldBackground,
      //     ),
      // switchTheme: const SwitchThemeData(
      //     // thumbColor: MaterialStateProperty.all<Color>(
      //     //   UIColors.dark.primary,
      //     // ),
      //     // trackColor: MaterialStateProperty.all<Color>(
      //     //   UIColors.dark.switchActiveTrackColor.withOpacity(0.5),
      //     // ),
      //     ),
      //?Typography
      typography: Typography.material2021(),
      textTheme: TextTheme(
        displayLarge: textStylesDark.displayLarge,
        displayMedium: textStylesDark.displayMedium,
        displaySmall: textStylesDark.displaySmall,
        headlineLarge: textStylesDark.headlineLarge,
        headlineMedium: textStylesDark.headlineMedium,
        headlineSmall: textStylesDark.headlineSmall,
        titleLarge: textStylesDark.titleLarge,
        titleMedium: textStylesDark.titleMedium,
        titleSmall: textStylesDark.titleSmall,
        bodyLarge: textStylesDark.bodyLarge,
        bodyMedium: textStylesDark.bodyMedium,
        bodySmall: textStylesDark.bodySmall,
        labelLarge: textStylesDark.labelLarge,
        labelMedium: textStylesDark.labelMedium,
        labelSmall: textStylesDark.labelSmall,
      ).apply(
        fontFamily: FontFamily.poppins,
      ),
      // textSelectionTheme: const TextSelectionThemeData(
      //     // selectionColor: UIColors.dark.textSelection,
      //     ),
      // textButtonTheme: const TextButtonThemeData(
      //   style: ButtonStyle(
      //       // backgroundColor: UIColors.dark.button,
      //       ),
      // ),
    );
  }
}
