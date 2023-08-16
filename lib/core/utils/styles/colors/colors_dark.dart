part of 'colors.dart';

class ColorsDark {
  const ColorsDark();

  Color get primary => const Color(0XFF004B78);
  Color get primaryShade => const Color(0XFFF0F9FF);

  Color get secondary => const Color(0XFFFF8200);
  Color get secondaryShade => const Color(0XFFFEF4EB);

  Color get secondaryScaffoldBackgroundColor => const Color(0XFFF6F7F7);

  Color get icon => Colors.black;
  Color get textSelection => Colors.grey.shade300;

  Color get switchActiveTrackColor => const Color(0XFF005288);
  Color get switchInactiveTrackColor => const Color(0XFF828282);

  Color get ternary => const Color(0XFF00AEEF);

  Color get title => const Color(0XFF394253);
  Color get bodyText => const Color(0xFF363636);
  Color get subTitle => const Color(0xFF394253);
  Color get caption => const Color(0xFF4A5363);
  Color get btn => const Color(0xffF3F3F4);
  Color get border => const Color(0xFFE9EDF0);

  Color get slate10 => const Color(0XFFB4BAC5);
  Color get slate20 => const Color(0XFFF3F6FB);
  Color get slate50 => const Color(0XFFE4E6E9);
  Color get slate400 => const Color(0XFFA2A9B4);
  Color get slate800 => const Color(0XFF6C757D);
  Color get blackShade => const Color(0XFF293042);
  Color get ghostWhite => const Color(0xFFF8F9FC);
  Color get greyShade => const Color(0XFF8D8D8D);
  Color get blackishBlue => const Color(0xFF004B78);

  Color get description => const Color(0XFF9C9C9C);
  Color get slate700 => const Color(0XFF4A5363);
  Color get slate100 => const Color(0XFFD8DDE6);

  Color get stepperInactiveShade => const Color(0XFFD9D9D9);

  Color get scaffoldBackground => Colors.white;
  Color get background => Colors.white;
  Color get asset => const Color(0xffF3F3F4); //! Rename?
  MaterialStateProperty<Color> get button => MaterialStateProperty.all<Color>(
        const Color(0xffF3F3F4),
      );

  Color get disableButtonColor => const Color(0xFFF4F4F4);

  Color get bottomNavBgColor => Colors.white;
  Color get bottomNavSelectedItem => const Color(0XFF004B78);
  Color get bottomNavUnSelectedItem => slate400;

  Color get grey => const Color(0XFF979797);
  Color get tealishGreen => const Color(0XFFE4FFE7);

  Color get stormGrey => const Color(0xff6C757D);

  Color get green => const Color(0xff6AC06A);
  Color get red => Colors.red;
  Color get white => const Color(0xFFFFFFFF);
  Color get transparent => Colors.transparent;

  Color get skyBlue => const Color(0xff00AEEF);

  Color get aliceBlue => const Color(0xffE9F9FF);
  Color get butteryWhite => const Color(0xffFFFCEB);

  Color get yellow => const Color(0xffFFD300);
  Color get gainsboro => const Color(0xffDCE0E0);
  Color get greyChateau => const Color(0xffA3A7AB);
  Color get cyanBlue => const Color(0xffB9CEDC);
  Color get seaShell => const Color(0xFFCEDDE5);

  LinearGradient get shimmerGradient => const LinearGradient(
        colors: [
          Color(0xFFEBEBF4),
          Color(0xFFF4F4F4),
          Color(0xFFEBEBF4),
        ],
        stops: [
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
      );

  List<BoxShadow> get primaryBoxShadow => [
        const BoxShadow(
          color: Color.fromRGBO(0, 75, 120, 0.25),
          offset: Offset(4, 8),
          blurRadius: 24,
        ),
      ];

  List<BoxShadow> get cardBoxShadow => [
        const BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          offset: Offset(4, 8),
          blurRadius: 24,
        ),
      ];

  List<BoxShadow> get categoryCardShadow => [
        const BoxShadow(
          color: Color.fromRGBO(106, 121, 139, 0.12),
          offset: Offset(1, 2),
          blurRadius: 12.0,
        ),
      ];
}
