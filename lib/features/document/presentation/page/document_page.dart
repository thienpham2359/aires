import 'package:file_reader/core/ui/widget/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/custom_divider.dart';
import '../../../../core/util/file_item.dart';
import '../controller/document_controller.dart';

class DocumentPage extends GetView<DocumentController> {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Documents"),
        actions: [
          IconButton(
              onPressed: () => controller.pickFiles(),
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.loading.value) {
            return const CustomLoader();
          }
          return Visibility(
            visible: controller.documentFiles.isNotEmpty,
            replacement: const Center(
              child: Text("No Files Found"),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.documentFiles.length,
              itemBuilder: (BuildContext context, int index) {
                return FileItem(
                  file: controller.documentFiles[index]!,
                  onDelete: () {
                    controller.deleteFile(controller.documentFiles[index]!);
                  },
                );
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
