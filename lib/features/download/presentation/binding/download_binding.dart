import 'package:get/get.dart';

import '../controller/download_controller.dart';

class DownloadBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => DownloadController());
  }
}
