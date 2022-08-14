import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/styles/colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: UIColors.primaryColor,
          primary: UIColors.primaryColor,
          secondary: UIColors.secondaryColor,
          background: UIColors.scaffoldBackgroundColorLight,
        ),
        scaffoldBackgroundColor: UIColors.scaffoldBackgroundColorLight,
        backgroundColor: UIColors.backgroundColorLight,
        drawerTheme: const DrawerThemeData(
          backgroundColor: UIColors.scaffoldBackgroundColorLight,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: UIColors.buttonColorLight,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: UIColors.bottomNavSelectedItemColorLight,
          unselectedItemColor: Color.fromRGBO(57, 66, 83, 1),
        ),
        appBarTheme: AppBarTheme(
          color: UIColors.backgroundColorLight,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          toolbarTextStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: 'POPPINS',
              fontWeight: FontWeight.w600,
            ),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: UIColors.backgroundColorLight,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        // primaryColorLight: const Color(0xffeeeeee).withOpacity(0.0),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: UIColors.scaffoldBackgroundColorLight,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          TextTheme(
            bodyText1: const TextStyle(color: UIColors.bodyTextColorLight),
            bodyText2: const TextStyle(color: UIColors.bodyTextColorLight),
            headline6: const TextStyle(color: UIColors.titleTextColorLight),
            subtitle1: TextStyle(
              color: UIColors.bodyTextColorLight,
              fontWeight: FontWeight.w600,
              fontSize: 20.0.sp,
            ),
            caption: TextStyle(
              color: UIColors.bodyTextColorLight,
              fontSize: 14.0.sp,
            ),
            subtitle2: TextStyle(
              color: UIColors.bodyTextColorLight,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.grey.shade300,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(
            UIColors.primaryColor,
          ),
          trackColor: MaterialStateProperty.all<Color>(
            UIColors.primaryColor.withOpacity(0.5),
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: UIColors.primaryColorDark,
          primary: UIColors.primaryColorDark,
          // onPrimary: Colors.white,
          secondary: UIColors.secondaryColorDark,
          background: UIColors.scaffoldBackgroundColorDark,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: UIColors.scaffoldBackgroundColorDark,
        backgroundColor: UIColors.backgroundColorDark,
        drawerTheme: const DrawerThemeData(
          backgroundColor: UIColors.scaffoldBackgroundColorDark,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: UIColors.buttonColorDark,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff201f1e),
          selectedItemColor: UIColors.bottomNavSelectedItemColorDark,
          unselectedItemColor: Color.fromRGBO(161, 159, 157, 1),
          elevation: 8,
        ),
        appBarTheme: AppBarTheme(
          color: UIColors.backgroundColorDark,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          toolbarTextStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontFamily: 'POPPINS',
              fontWeight: FontWeight.w600,
            ),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: UIColors.backgroundColorDark,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        // primaryColorLight: const Color(0xff111111).withOpacity(0.0),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: UIColors.scaffoldBackgroundColorDark,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          TextTheme(
            bodyText1: const TextStyle(color: UIColors.bodyTextColorDark),
            bodyText2: const TextStyle(color: UIColors.bodyTextColorDark),
            headline6: const TextStyle(color: UIColors.titleTextColorDark),
            subtitle1: TextStyle(
              color: UIColors.bodyTextColorDark,
              fontWeight: FontWeight.w600,
              fontSize: 20.0.sp,
            ),
            caption: TextStyle(
              color: UIColors.bodyTextColorDark,
              fontSize: 14.0.sp,
            ),
            subtitle2: TextStyle(
              color: UIColors.bodyTextColorDark,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.grey.shade700,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(
            UIColors.primaryColorDark,
          ),
          trackColor: MaterialStateProperty.all<Color>(
            UIColors.primaryColorDark.withOpacity(0.5),
          ),
        ),
      );
}
