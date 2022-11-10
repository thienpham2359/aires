import 'package:file_reader/features/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

import '../controller/browsing_controller.dart';

class BrowsingBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => BrowsingController());
  }
}
