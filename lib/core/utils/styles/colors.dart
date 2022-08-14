import 'package:flutter/material.dart';

class UIColors {
  //LIGHT THEME COLORS
  static const Color primaryColor = Color(0XFF553BB9);
  static const Color secondaryColor = Color(0XFF8B1957);
  static const Color bodyTextColorLight = Color(0xFF4A5363);
  static const Color titleTextColorLight = Color(0XFF394253);
  static const Color scaffoldBackgroundColorLight = Color(0xFFF6F7F7);
  static const Color backgroundColorLight = Colors.white;
  static const Color assetColorLight = Color(0xffF3F3F4); //! Rename?
  static MaterialStateProperty<Color> buttonColorLight =
      MaterialStateProperty.all<Color>(const Color(0xffF3F3F4));

  //DARK THEME COLORS
  static const Color primaryColorDark = Color(0XFFB19BE9);
  static const Color secondaryColorDark = Color(0XFFE363A9);
  static const Color bodyTextColorDark = Color(0XFFC8C6C4);
  static const Color titleTextColorDark = Colors.white;
  static const Color scaffoldBackgroundColorDark = Color(0xFF191919);
  static const Color backgroundColorDark = Color(0xff252526);
  static const Color assetColorDark = Color(0xff252526); //! Rename?
  static MaterialStateProperty<Color> buttonColorDark =
      MaterialStateProperty.all<Color>(const Color(0xff252526));

  static const Color bottomNavSelectedItemColorLight =
      Color.fromRGBO(56, 28, 126, 1);
  static const Color bottomNavSelectedItemColorDark =
      Color.fromRGBO(177, 155, 233, 1);

  static const Color bottomNavSelectedItemCircleColorLight =
      Color.fromRGBO(239, 237, 245, 1);
  static const Color bottomNavSelectedItemCircleColorDark =
      Color.fromRGBO(79, 63, 119, 1);

  static const textColorLight = Color(0xFF363636);
  static const textColorDark = Colors.white;

  //GRADIENTS
  static const Gradient primaryGradient =
      LinearGradient(colors: [primaryColor, Color(0xff7237ac)]);
  static const Gradient secondaryGradient =
      LinearGradient(colors: [secondaryColor, Color(0xffbc3f79)]);

  static const Gradient blueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[Color(0xFF465DE1), Color(0xFF754BA3)],
  );

  static List<Gradient> gradients = <Gradient>[
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Color(0xFFFECFB3), Color(0xFFFBEEE2)],
    ),
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Color(0xFFEAB4FD), Color(0xFFEEE1D8)],
    ),
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Color(0xFFBEFEB3), Color(0xFFF5E8E7)],
    ),
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Color(0xFF3586A3), Color(0xFFF5E8E7)],
    ),
    // LinearGradient(colors: <Color>[Color(0xFFFECFB3), Color(0xFFFBEEE2)]),
  ];
  static List<Gradient> eventBgGradients = <Gradient>[
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Color(0xFF6D5CE6), Color(0xFFF0326E)],
    ),
    // LinearGradient(
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     colors: <Color>[Color(0xFFEAB4FD), Color(0xFFEEE1D8)]),
    // LinearGradient(
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     colors: <Color>[Color(0xFFBEFEB3), Color(0xFFF5E8E7)]),
    // LinearGradient(
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     colors: <Color>[Color(0xFF3586A3), Color(0xFFF5E8E7)]),
    // LinearGradient(colors: <Color>[Color(0xFFFECFB3), Color(0xFFFBEEE2)]),
  ];

  static List<Color> offerTileRandomColors = <Color>[
    const Color(0xFF7490E6),
    const Color(0xFF49DBDA),
    const Color(0xFFF9A3A3),
    const Color(0xFFA58BFE)
  ];

  static const LinearGradient shimmerGradient = LinearGradient(
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

  static const LinearGradient shimmerDarkGradient = LinearGradient(
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

  //BoxShadows
  static const List<BoxShadow> primaryBoxShadowLight = [
    BoxShadow(
      color: Color(0xffdbd0ed),
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
  ];
  static const List<BoxShadow> secondaryBoxShadowLight = [
    BoxShadow(
      color: Color(0xffebd7e2),
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
  ];
  static const List<BoxShadow> primaryBoxShadowLDark = [
    BoxShadow(
      color: Color(0xff383148),
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
  ];
  static const List<BoxShadow> secondaryBoxShadowDark = [
    BoxShadow(
      color: Color(0xFF553646),
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
  ];
}
