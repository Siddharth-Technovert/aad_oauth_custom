import '../styles/dimensions/ui_dimensions.dart';

class ImageUtils {
  //TODO: add your custom ratio here
  static double getHeightForBannerRatio({required double width}) {
    return UIDimensions.height((width * 118) / 343);
  }

  static double getHeightForNewsCard({required double width}) {
    return UIDimensions.height((width * 9) / 16);
  }
}
