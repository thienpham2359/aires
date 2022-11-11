import 'dart:io';

import 'package:file_reader/core/ui/widget/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mime_type/mime_type.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/custom_divider.dart';
import '../../../../core/util/file_item.dart';
import '../controller/audio_controller.dart';

class AudioPage extends GetView<AudioController> {
  const AudioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.parameters['title'] ?? ""),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.loading.value) {
            return const CustomLoader();
          }
          return Visibility(
            visible: controller.audios.isNotEmpty,
            replacement: const Center(
              child: Text("No Files Found"),
            ),
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 20),
              itemCount: controller.audios.length,
              itemBuilder: (BuildContext context, int index) {
                FileSystemEntity file = controller.audios[index]!;
                return FileItem(file: file);
              },
              separatorBuilder: (BuildContext context, int index) {
                return CustomDivider();
              },
            ),
          );
        }),
      ),
    );
  }
}
