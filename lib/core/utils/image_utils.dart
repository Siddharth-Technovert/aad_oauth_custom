import 'styles/dimensions/ui_dimensions.dart';

class ImageUtils {
  //TODO: add your custom ratio here
  static double getHeightForNewsCard({required double width}) {
    return UIDimensions.height((width * 9) / 16);
  }
}
