import 'package:file_reader/core/ui/widget/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/custom_divider.dart';
import '../../../../core/util/file_item.dart';
import '../controller/download_controller.dart';

class DownloadPage extends GetView<DownloadController> {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Downloads"),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.loading.value) {
            return const CustomLoader();
          }
          return Visibility(
            visible: controller.downloadFiles.isNotEmpty,
            replacement: const Center(child: Text("No Files Found"),),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.downloadFiles.length,
              itemBuilder: (BuildContext context, int index) {
                return FileItem(file: controller.downloadFiles[index]!);
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
