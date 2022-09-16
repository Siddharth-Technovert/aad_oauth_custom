part of 'app_theme.dart';

class _AppThemeLight {
  const _AppThemeLight();
  ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: UIColors.light.primary,
          primary: UIColors.light.primary,
          secondary: UIColors.light.secondary,
          background: UIColors.light.scaffoldBackground,
        ),
        scaffoldBackgroundColor: UIColors.light.scaffoldBackground,
        backgroundColor: UIColors.light.background,
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
          headline1: UITextStyles.light.h1,
          headline2: UITextStyles.light.h2,
          headline3: UITextStyles.light.h3,
          headline4: UITextStyles.light.h4,
          headline5: UITextStyles.light.h5,
          headline6: UITextStyles.light.h6,
          bodyText1: UITextStyles.light.bodyText1,
          bodyText2: UITextStyles.light.bodyText2,
          button: UITextStyles.defaultButtonStyle(),
          caption: UITextStyles.light.caption,
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
            UIColors.light.primary.withOpacity(0.5),
          ),
        ),
      );
}
