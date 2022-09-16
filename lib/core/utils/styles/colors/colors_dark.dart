part of 'colors.dart';

class _ColorsDark {
  const _ColorsDark();

  Color get primary => const Color(0XFFB19BE9);
  Color get secondary => const Color(0XFFE363A9);

  Color get icon => Colors.white;
  Color get textSelection => Colors.grey.shade700;

  Color get title => Colors.white;
  Color get bodyText => Colors.white;
  Color get subTitle => Colors.white;
  Color get caption => const Color(0XFFC8C6C4);
  Color get btn => const Color(0xff252526);

  Color get scaffoldBackground => const Color(0xFF191919);
  Color get background => const Color(0xff252526);
  Color get asset => const Color(0xffF3F3F4); //! Rename?
  MaterialStateProperty<Color> get button => MaterialStateProperty.all<Color>(
        const Color(0xff252526),
      );

  Color get bottomNavBgColor => const Color(0xff201f1e);
  Color get bottomNavSelectedItem => const Color.fromRGBO(177, 155, 233, 1);
  Color get bottomNavUnSelectedItem => const Color.fromRGBO(161, 159, 157, 1);
  Color get bottomNavSelectedItemCircle => const Color.fromRGBO(79, 63, 119, 1);

  LinearGradient get shimmerGradient => const LinearGradient(
        colors: [
          Color(0xFF3A3A3A),
          Color(0xFF3F3F3F),
          Color(0xFF4A4A4A),
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
          color: Color(0xff383148),
          offset: Offset(0, 4),
          blurRadius: 6,
        ),
      ];
  List<BoxShadow> get secondaryBoxShadow => [
        const BoxShadow(
          color: Color(0xFF553646),
          offset: Offset(0, 4),
          blurRadius: 6,
        ),
      ];
}
