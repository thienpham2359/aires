import 'package:get/get.dart';

import '../controller/encrypt_controller.dart';

class EncryptBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => EncryptController());
  }
}
