import 'package:get/get.dart';

import '../controller/audio_controller.dart';

class AudioBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AudioController());
  }
}
