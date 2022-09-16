part of 'text_styles.dart';

class _TextStylesDark {
  const _TextStylesDark();

  TextStyle get h1 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.title,
        fontSize: 28.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get h2 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.title,
        fontSize: 24.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get h3 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.title,
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get h4 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.title,
        fontSize: 18.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get h5 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.title,
        fontSize: 16.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get h6 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.title,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get subtitle1 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.subTitle,
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w600,
      );

  TextStyle get subtitle2 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.subTitle,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w400,
      );

  TextStyle get bodyText1 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.bodyText,
        fontSize: 16.0.sp,
        fontWeight: FontWeight.normal,
      );

  TextStyle get bodyText2 => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.bodyText,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.normal,
      );

  TextStyle get caption => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.caption,
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get captionBold => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.caption,
        fontSize: 12.0.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get primaryBtn => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.primary,
      );

  TextStyle get secondaryBtn => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.secondary,
      );

  TextStyle get disabledBtn => UITextStyles.defaultStyle().copyWith(
        color: UIColors.dark.btn,
      );
}
