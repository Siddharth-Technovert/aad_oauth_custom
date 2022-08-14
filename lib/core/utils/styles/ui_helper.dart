import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  static const Widget verticalSpaceSmall = RSizedBox(height: 8);
  static const Widget verticalSpaceMedium = RSizedBox(height: 16);
  static const Widget verticalSpaceLarge = RSizedBox(height: 32);

  static const Widget horizontalSpaceSmall = RSizedBox(width: 8);
  static const Widget horizontalSpaceMedium = RSizedBox(width: 16);
  static const Widget horizontalSpaceLarge = RSizedBox(width: 32);

  static Widget verticalSpace(double height) => RSizedBox(height: height);
  static Widget horizontalSpace(double width) => RSizedBox(width: width);
}
