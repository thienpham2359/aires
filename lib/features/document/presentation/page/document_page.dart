import 'package:file_picker/file_picker.dart';
import 'package:file_reader/core/ui/widget/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/util/constants.dart';
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
            onPressed: () => _openBottomSheet(),
            icon: const Icon(Icons.add),
          ),
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

  void _openBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height / 3,
        color: Colors.white,
        child: ListView.builder(
          itemCount: importOtps.length,
          itemBuilder: (context, index) {
            Map opt = importOtps[index];
            return ListTile(
              onTap: () async {
                switch (index) {
                  case 0:
                    if (await Permission.mediaLibrary.isGranted) {
                      controller.pickFiles(FileType.media);
                      Get.back();
                    } else {
                      await Permission.mediaLibrary.request();
                    }
                    break;
                  case 1:
                    controller.pickImage(ImageSource.camera);
                    Get.back();
                    break;
                  case 2:
                    controller.pickVideo(ImageSource.camera);
                    Get.back();
                    break;
                  case 3:
                    if (await Permission.storage.isGranted) {
                      controller.pickFiles(FileType.any);
                      Get.back();
                    } else {
                      await Permission.storage.request();
                    }
                    break;
                }
              },
              leading: Icon(opt['icon']),
              title: Text(opt['title']),
            );
          },
        ),
      ),
    );
  }
}
