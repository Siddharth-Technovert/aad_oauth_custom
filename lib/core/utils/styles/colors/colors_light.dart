part of 'colors.dart';

class _ColorsLight {
  const _ColorsLight();

  Color get primary => const Color(0XFF553BB9);
  Color get secondary => const Color(0XFF8B1957);

  Color get icon => Colors.black;
  Color get textSelection => Colors.grey.shade300;

  Color get title => const Color(0XFF394253);
  Color get bodyText => const Color(0xFF363636);
  Color get subTitle => const Color(0xFF394253);
  Color get caption => const Color(0xFF4A5363);
  Color get btn => const Color(0xffF3F3F4);

  Color get scaffoldBackground => const Color(0xFFF6F7F7);
  Color get background => Colors.white;
  Color get asset => const Color(0xffF3F3F4); //! Rename?
  MaterialStateProperty<Color> get button => MaterialStateProperty.all<Color>(
        const Color(0xffF3F3F4),
      );

  Color get bottomNavBgColor => Colors.white;
  Color get bottomNavSelectedItem => const Color.fromRGBO(56, 28, 126, 1);
  Color get bottomNavUnSelectedItem => const Color.fromRGBO(57, 66, 83, 1);
  Color get bottomNavSelectedItemCircle =>
      const Color.fromRGBO(239, 237, 245, 1);

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
          color: Color(0xffdbd0ed),
          offset: Offset(0, 4),
          blurRadius: 6,
        ),
      ];
  List<BoxShadow> get secondaryBoxShadow => [
        const BoxShadow(
          color: Color(0xffebd7e2),
          offset: Offset(0, 4),
          blurRadius: 6,
        ),
      ];
}
