import 'package:file_reader/features/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

import '../controller/browse_controller.dart';

class BrowseBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => BrowseController());
  }
}
