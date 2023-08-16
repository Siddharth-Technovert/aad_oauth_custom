part of 'app_theme.dart';

class AppThemeLight {
  const AppThemeLight();
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Urbanist',
        colorScheme: ColorScheme.fromSeed(
          seedColor: UIColors.light.primary,
          primary: UIColors.light.primary,
          secondary: UIColors.light.secondary,
          background: UIColors.light.background,
          // background: UIColors.light.scaffoldBackground,
        ),
        scaffoldBackgroundColor: UIColors.light.scaffoldBackground,
        drawerTheme: DrawerThemeData(
          backgroundColor: UIColors.light.scaffoldBackground,
        ),
        appBarTheme: AppBarTheme(
          color: UIColors.light.background,
          iconTheme: IconThemeData(color: UIColors.light.icon),
          titleTextStyle: UITextStyles.light.h3,
          toolbarTextStyle: UITextStyles.light.h6,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: UIColors.light.background,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        iconTheme: IconThemeData(
          color: UIColors.light.icon,
        ),
        textTheme: TextTheme(
          displayLarge: UITextStyles.light.h1,
          displayMedium: UITextStyles.light.h2,
          displaySmall: UITextStyles.light.h3,
          headlineMedium: UITextStyles.light.h4,
          headlineSmall: UITextStyles.light.h5,
          titleLarge: UITextStyles.light.subtitle1,
          headlineLarge: UITextStyles.light.subtitle3,
          bodyLarge: UITextStyles.light.bodyText1,
          bodyMedium: UITextStyles.light.bodyText2,
          labelLarge: UITextStyles.defaultButtonStyle(),
          bodySmall: UITextStyles.light.caption,
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: UIColors.light.textSelection,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: UIColors.light.button,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: UIColors.light.bottomNavBgColor,
          selectedItemColor: UIColors.light.bottomNavSelectedItem,
          unselectedItemColor: UIColors.light.bottomNavUnSelectedItem,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: UIColors.light.scaffoldBackground,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(
            UIColors.light.primary,
          ),
          trackColor: MaterialStateProperty.all<Color>(
            UIColors.light.switchActiveTrackColor.withOpacity(0.5),
          ),
        ),
      );
}
