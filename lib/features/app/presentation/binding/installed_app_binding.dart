import 'package:get/get.dart';

import '../controller/installed_app_controller.dart';

class InstalledAppBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => InstalledAppController());
  }
}
