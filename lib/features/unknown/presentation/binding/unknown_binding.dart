import 'package:get/get.dart';

import '../controller/unknown_controller.dart';

class UnknownBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => UnknownController());
  }
}
