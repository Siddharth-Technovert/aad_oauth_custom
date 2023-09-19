import 'package:flutter/widgets.dart';

import 'ui_colors.dart';
import 'ui_custom_colors.dart';

class UIColorsLight implements UIColors {
  @override
  Color get primary => const Color(0xff1565c0);
  @override
  Color get onPrimary => const Color(0xffffffff);
  @override
  Color get primaryContainer => const Color(0xff90caf9);
  @override
  Color get onPrimaryContainer => const Color(0xff0c1114);
  @override
  Color get secondary => const Color(0xff039be5);
  @override
  Color get onSecondary => const Color(0xffffffff);
  @override
  Color get secondaryContainer => const Color(0xffcbe6ff);
  @override
  Color get onSecondaryContainer => const Color(0xff111314);
  @override
  Color get tertiary => const Color(0xff0277bd);
  @override
  Color get onTertiary => const Color(0xffffffff);
  @override
  Color get tertiaryContainer => const Color(0xffbedcff);
  @override
  Color get onTertiaryContainer => const Color(0xff101214);
  @override
  Color get error => const Color(0xffb00020);
  @override
  Color get onError => const Color(0xffffffff);
  @override
  Color get errorContainer => const Color(0xfffcd8df);
  @override
  Color get onErrorContainer => const Color(0xff141213);
  @override
  Color get background => const Color(0xfffafbfc);
  @override
  Color get onBackground => const Color(0xff0e0e0e);
  @override
  Color get surface => const Color(0xfffdfdfe);
  @override
  Color get onSurface => const Color(0xff090909);
  @override
  Color get surfaceVariant => const Color(0xffeaebed);
  @override
  Color get onSurfaceVariant => const Color(0xff121212);
  @override
  Color get outline => const Color(0xff818181);
  @override
  Color get outlineVariant => const Color(0xffcdcdcd);
  @override
  Color get shadow => const Color(0xff000000);
  @override
  Color get scrim => const Color(0xff000000);
  @override
  Color get inverseSurface => const Color(0xff111112);
  @override
  Color get onInverseSurface => const Color(0xfff5f5f5);
  @override
  Color get inversePrimary => const Color(0xffaedfff);
  @override
  Color get surfaceTint => const Color(0xff1565c0);

  @override
  UICustomColors get customColors => const UICustomColors(
        font28Color: Color(0xff000000),
        font24Color: Color(0xff000000),
        font20Color: Color(0xff000000),
        font18Color: Color(0xff000000),
        font16Color: Color(0xff000000),
        font14Color: Color(0xff000000),
        font12Color: Color(0xFF858992),
        whiteColor: Color(0xffffffff),
        blackColor: Color(0xff000000),
        redColor: Color(0xFFF44336),
        greenColor: Color(0xFF2bbb2b),
        greyColor: Color(0xFF9E9E9E),
        marinerColor: Color(0xFF4268A1),
        loadingIndicatorColor: Color(0xFF193764),
      );
}
