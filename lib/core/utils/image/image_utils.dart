/*This class will hold all common methods for using images. It will hold methods to pick image from
gallery, etc.*/
import '../styles/dimensions/ui_dimensions.dart';

class ImageUtils {
  static final ImageUtils _imageUtils = ImageUtils._internal();

  factory ImageUtils() {
    return _imageUtils;
  }

  ImageUtils._internal();

  //TODO: add your custom ratio here
  double getHeightForBannerRatio({required double width}) {
    return UIDimensions.height((width * 118) / 343);
  }
}
