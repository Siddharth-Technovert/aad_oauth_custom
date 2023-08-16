part of 'app_theme.dart';

class AppThemeDark {
  const AppThemeDark();
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Urbanist',
        colorScheme: ColorScheme.fromSeed(
          seedColor: UIColors.dark.primary,
          primary: UIColors.dark.primary,
          secondary: UIColors.dark.secondary,
          background: UIColors.dark.background,
          // background: UIColors.dark.scaffoldBackground,
        ),
        scaffoldBackgroundColor: UIColors.dark.scaffoldBackground,
        drawerTheme: DrawerThemeData(
          backgroundColor: UIColors.dark.scaffoldBackground,
        ),
        appBarTheme: AppBarTheme(
          color: UIColors.dark.background,
          iconTheme: IconThemeData(color: UIColors.dark.icon),
          titleTextStyle: UITextStyles.dark.h3,
          toolbarTextStyle: UITextStyles.dark.h6,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: UIColors.dark.background,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        iconTheme: IconThemeData(
          color: UIColors.dark.icon,
        ),
        textTheme: TextTheme(
          displayLarge: UITextStyles.dark.h1,
          displayMedium: UITextStyles.dark.h2,
          displaySmall: UITextStyles.dark.h3,
          headlineMedium: UITextStyles.dark.h4,
          headlineSmall: UITextStyles.dark.h5,
          titleLarge: UITextStyles.dark.subtitle1,
          headlineLarge: UITextStyles.dark.subtitle3,
          bodyLarge: UITextStyles.dark.bodyText1,
          bodyMedium: UITextStyles.dark.bodyText2,
          labelLarge: UITextStyles.defaultButtonStyle(),
          bodySmall: UITextStyles.dark.caption,
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: UIColors.dark.textSelection,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: UIColors.dark.button,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: UIColors.dark.bottomNavBgColor,
          selectedItemColor: UIColors.dark.bottomNavSelectedItem,
          unselectedItemColor: UIColors.dark.bottomNavUnSelectedItem,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: UIColors.dark.scaffoldBackground,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(
            UIColors.dark.primary,
          ),
          trackColor: MaterialStateProperty.all<Color>(
            UIColors.dark.switchActiveTrackColor.withOpacity(0.5),
          ),
        ),
      );
}
