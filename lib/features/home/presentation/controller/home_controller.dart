import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/route/app_routes.dart';
import '../../../../core/util/dialog/dialogs.dart';

class HomeController extends GetxController {

  void requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      Get.toNamed(AppRoutes.BROWSING);
    } else {
      Dialogs.showToast('Please Grant Storage Permissions');
    }
  }
}
