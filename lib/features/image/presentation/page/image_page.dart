import 'dart:io';

import 'package:file_reader/core/ui/widget/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mime_type/mime_type.dart';

import '../../../../core/util/constants.dart';
import '../controller/image_controller.dart';
import '../widget/media_tile.dart';

class ImagePage extends GetView<ImageController> {
  const ImagePage({Key? key}) : super(key: key);

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
            visible: controller.images.isNotEmpty,
            replacement: const Center(
              child: Text("No Files Found"),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                primary: false,
                slivers: [
                  SliverGrid.count(
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    crossAxisCount: 2,
                    children: map(
                      controller.images,
                      (index, item) {
                        File file = File(item.path);
                        String path = file.path;
                        String mimeType = mime(path) ?? '';
                        return MediaTile(file: file, mimeType: mimeType);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
