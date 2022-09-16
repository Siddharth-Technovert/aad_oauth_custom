part of 'text_styles.dart';

class _TextStylesLight {
  const _TextStylesLight();

  TextStyle get h1 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.title,
        fontSize: 28.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get h2 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.title,
        fontSize: 24.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get h3 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.title,
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get h4 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.title,
        fontSize: 18.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get h5 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.title,
        fontSize: 16.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get h6 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.title,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get subtitle1 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.subTitle,
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w600,
      );

  TextStyle get subtitle2 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.subTitle,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w400,
      );

  TextStyle get bodyText1 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.bodyText,
        fontSize: 16.0.sp,
        fontWeight: FontWeight.normal,
      );

  TextStyle get bodyText2 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.bodyText,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.normal,
      );

  TextStyle get caption => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.caption,
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get captionBold => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.caption,
        fontSize: 12.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get primaryBtn => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.primary,
      );

  TextStyle get secondaryBtn => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.secondary,
      );

  TextStyle get disabledBtn => UITextStyles.defaultStyle().copyWith(
        color: UIColors.light.btn,
      );
}
