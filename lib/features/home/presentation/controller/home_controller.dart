import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/route/app_routes.dart';
import '../../../../core/util/dialog/dialogs.dart';

class HomeController extends GetxController {
  RxBool get isStoragePermissionGranted => false.obs;

  void requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      isStoragePermissionGranted.value = true;
    } else {
      Dialogs.showToast('Please Grant Storage Permissions');
      isStoragePermissionGranted.value = false;
    }
  }
}
