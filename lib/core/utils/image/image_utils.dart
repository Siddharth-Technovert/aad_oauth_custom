import 'package:flutter_screenutil/flutter_screenutil.dart';

/*This class will hold all common methods for using images. It will hold methods to pick image from
gallery, etc.*/
class ImageUtils {
  static final ImageUtils _imageUtils = ImageUtils._internal();

  factory ImageUtils() {
    return _imageUtils;
  }

  ImageUtils._internal();

  double getHeightForBannerRatio({required double width}) {
    return ((width * 118) / 343).h;
  }
}
