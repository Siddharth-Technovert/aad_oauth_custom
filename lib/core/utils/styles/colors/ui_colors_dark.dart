import 'package:flutter/widgets.dart';

import 'ui_colors.dart';
import 'ui_custom_colors.dart';

class UIColorsDark implements UIColors {
  @override
  Color get primary => const Color(0xff90caf9);
  @override
  Color get onPrimary => const Color(0xff060708);
  @override
  Color get primaryContainer => const Color(0xff0d47a1);
  @override
  Color get onPrimaryContainer => const Color(0xfff3f6fc);
  @override
  Color get secondary => const Color(0xff81d4fa);
  @override
  Color get onSecondary => const Color(0xff050808);
  @override
  Color get secondaryContainer => const Color(0xff004b73);
  @override
  Color get onSecondaryContainer => const Color(0xfff2f7f9);
  @override
  Color get tertiary => const Color(0xffe1f5fe);
  @override
  Color get onTertiary => const Color(0xff080808);
  @override
  Color get tertiaryContainer => const Color(0xff1a567d);
  @override
  Color get onTertiaryContainer => const Color(0xfff4f7fa);
  @override
  Color get error => const Color(0xffcf6679);
  @override
  Color get onError => const Color(0xff080405);
  @override
  Color get errorContainer => const Color(0xffb1384e);
  @override
  Color get onErrorContainer => const Color(0xfffdf6f7);
  @override
  Color get background => const Color(0xff16181a);
  @override
  Color get onBackground => const Color(0xfff4f4f4);
  @override
  Color get surface => const Color(0xff141618);
  @override
  Color get onSurface => const Color(0xfff7f7f7);
  @override
  Color get surfaceVariant => const Color(0xff373b3e);
  @override
  Color get onSurfaceVariant => const Color(0xfff2f2f2);
  @override
  Color get outline => const Color(0xff818181);
  @override
  Color get outlineVariant => const Color(0xff353535);
  @override
  Color get shadow => const Color(0xff000000);
  @override
  Color get scrim => const Color(0xff000000);
  @override
  Color get inverseSurface => const Color(0xfffbfdfe);
  @override
  Color get onInverseSurface => const Color(0xff070707);
  @override
  Color get inversePrimary => const Color(0xff4a6374);
  @override
  Color get surfaceTint => const Color(0xff90caf9);

  @override
  UICustomColors get customColors => const UICustomColors(
        font28Color: Color(0xfff0f0f0),
        font24Color: Color(0xfff0f0f0),
        font20Color: Color(0xfff0f0f0),
        font18Color: Color(0xfff0f0f0),
        font16Color: Color(0xfff0f0f0),
        font14Color: Color(0xffcccccc),
        font12Color: Color(0xffcccccc),
        whiteColor: Color(0xffffffff),
        blackColor: Color(0xff000000),
        redColor: Color(0xFFF44336),
        greenColor: Color(0xFF32cf32),
        greyColor: Color(0xFF9E9E9E),
        marinerColor: Color(0xFF9ab2d5),
        loadingIndicatorColor: Color(0xFF5286d3),
      );
}
