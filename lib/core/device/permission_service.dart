import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> activityPermission() async {
    await [Permission.activityRecognition].request();
    final status = await Permission.activityRecognition.status;
    if (status.isGranted) {
      return true;
    }
    return false;
  }

  Future<bool> storagePermission() async {
    await [Permission.storage].request();
    final status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    }
    return false;
  }
}
