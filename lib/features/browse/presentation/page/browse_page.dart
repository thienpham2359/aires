import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

import '../../../../core/route/app_routes.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/custom_divider.dart';
import '../controller/browse_controller.dart';

class BrowsePage extends GetView<BrowseController> {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Browsing"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              Map category = categories[index];
              return ListTile(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.toNamed(AppRoutes.DOCUMENT);
                      break;
                    case 1:
                      Get.toNamed(AppRoutes.IMAGE,
                          parameters: {"title": categories[index]['title']});
                      break;
                    case 2:
                      Get.toNamed(AppRoutes.IMAGE,
                          parameters: {"title": categories[index]['title']});
                      break;
                    case 3:
                      Get.toNamed(AppRoutes.AUDIO,
                          parameters: {"title": categories[index]['title']});
                      break;
                    case 4:
                      Get.toNamed(AppRoutes.AUDIO,
                          parameters: {"title": categories[index]['title']});
                      break;
                    case 5:
                      Get.toNamed(AppRoutes.APP);
                      break;
                    default:
                      break;
                  }
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                      width: 2,
                    ),
                  ),
                  child: Icon(category['icon'], size: 18, color: category['color']),
                ),
                title: Text('${category['title']}'),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return CustomDivider();
            },
          ),
        ),
      ),
    );
  }
}
