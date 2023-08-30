import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/assets_gen/fonts.gen.dart';
import '../../utils/styles/colors/ui_colors.dart';
import '../../utils/styles/colors/ui_colors_light.dart';
import '../../utils/styles/dimensions/ui_dimensions.dart';
import '../../utils/styles/text_styles/ui_text_styles.dart';
import '../../utils/styles/text_styles/ui_text_styles_light.dart';

class AppThemeLight {
  final UIColors colors = UIColorsLight();
  final UITextStyles textStyles = UITextStylesLight();

  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: FontFamily.poppins,
      colorScheme: _colorScheme,
      //?Theme Extensions
      extensions: [colors.customColors],
      //?Typography
      typography: Typography.material2021(
        platform:
            Platform.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
        colorScheme: const ColorScheme.dark(),
      ),
      textTheme: _textTheme,
      primaryTextTheme: _primaryTextTheme,
      textSelectionTheme: TextSelectionThemeData(cursorColor: colors.primary),
      //?Shapes Theme
      iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      navigationBarTheme: _navigationBarTheme,
      inputDecorationTheme: _inputDecorationTheme,
    );
  }

  ColorScheme get _colorScheme => ColorScheme(
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
      );

  IconThemeData get _iconTheme => IconThemeData(
        size: UIDimensions.icon24,
        color: colors.onBackground,
      );

  TextTheme get _textTheme => TextTheme(
        displayLarge: textStyles.displayLarge,
        displayMedium: textStyles.displayMedium,
        displaySmall: textStyles.displaySmall,
        headlineLarge: textStyles.headlineLarge,
        headlineMedium: textStyles.headlineMedium,
        headlineSmall: textStyles.headlineSmall,
        titleLarge: textStyles.titleLarge,
        titleMedium: textStyles.titleMedium,
        titleSmall: textStyles.titleSmall,
        bodyLarge: textStyles.bodyLarge,
        bodyMedium: textStyles.bodyMedium,
        bodySmall: textStyles.bodySmall,
        labelLarge: textStyles.labelLarge,
        labelMedium: textStyles.labelMedium,
        labelSmall: textStyles.labelSmall,
      ).apply(
        fontFamily: FontFamily.poppins,
      );

  TextTheme get _primaryTextTheme => TextTheme(
        displayLarge: textStyles.displayLarge.copyWith(color: colors.primary),
        displayMedium: textStyles.displayMedium.copyWith(color: colors.primary),
        displaySmall: textStyles.displaySmall.copyWith(color: colors.primary),
        headlineLarge: textStyles.headlineLarge.copyWith(color: colors.primary),
        headlineMedium:
            textStyles.headlineMedium.copyWith(color: colors.primary),
        headlineSmall: textStyles.headlineSmall.copyWith(color: colors.primary),
        titleLarge: textStyles.titleLarge.copyWith(color: colors.primary),
        titleMedium: textStyles.titleMedium.copyWith(color: colors.primary),
        titleSmall: textStyles.titleSmall.copyWith(color: colors.primary),
        bodyLarge: textStyles.bodyLarge.copyWith(color: colors.primary),
        bodyMedium: textStyles.bodyMedium.copyWith(color: colors.primary),
        bodySmall: textStyles.bodySmall.copyWith(color: colors.primary),
        labelLarge: textStyles.labelLarge.copyWith(color: colors.primary),
        labelMedium: textStyles.labelMedium.copyWith(color: colors.primary),
        labelSmall: textStyles.labelSmall.copyWith(color: colors.primary),
      ).apply(
        fontFamily: FontFamily.poppins,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        iconTheme: _iconTheme,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: colors.background,
        ),
      );

  NavigationBarThemeData get _navigationBarTheme => NavigationBarThemeData(
        height: UIDimensions.height(80),
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        border: UIDimensions.inputDecorationBorder(colors.background),
        enabledBorder: UIDimensions.inputDecorationBorder(colors.background),
        focusedBorder: UIDimensions.inputDecorationBorder(colors.primary),
        disabledBorder: UIDimensions.inputDecorationBorder(colors.background),
        hintStyle: textStyles.bodyMedium.copyWith(color: colors.onBackground),
        contentPadding: UIDimensions.allPaddingGeometry(16),
        filled: true,
        isDense: true,
        suffixIconColor: colors.onBackground,
        prefixIconColor: colors.onBackground,
      );
}
