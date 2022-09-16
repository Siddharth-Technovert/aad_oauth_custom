part of 'app_theme.dart';

class _AppThemeDark {
  const _AppThemeDark();
  ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: UIColors.dark.primary,
          primary: UIColors.dark.primary,
          secondary: UIColors.dark.secondary,
          background: UIColors.dark.scaffoldBackground,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: UIColors.dark.scaffoldBackground,
        backgroundColor: UIColors.dark.background,
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
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        iconTheme: IconThemeData(
          color: UIColors.light.icon,
        ),
        textTheme: TextTheme(
          headline1: UITextStyles.dark.h1,
          headline2: UITextStyles.dark.h2,
          headline3: UITextStyles.dark.h3,
          headline4: UITextStyles.dark.h4,
          headline5: UITextStyles.dark.h5,
          headline6: UITextStyles.dark.h6,
          bodyText1: UITextStyles.dark.bodyText1,
          bodyText2: UITextStyles.dark.bodyText2,
          button: UITextStyles.defaultButtonStyle(),
          caption: UITextStyles.dark.caption,
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
          backgroundColor: UIColors.light.bottomNavBgColor,
          selectedItemColor: UIColors.dark.bottomNavSelectedItem,
          unselectedItemColor: UIColors.dark.bottomNavUnSelectedItem,
          elevation: 8,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: UIColors.dark.scaffoldBackground,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(
            UIColors.dark.primary,
          ),
          trackColor: MaterialStateProperty.all<Color>(
            UIColors.dark.primary.withOpacity(0.5),
          ),
        ),
      );
}
