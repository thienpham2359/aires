import 'package:file_reader/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/custom_divider.dart';
import '../controller/browse_controller.dart';

class BrowsePage extends GetView<BrowseController> {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getDownloads();
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
                  // if (index == categories.length - 1) {
                  //   // Check if the user has whatsapp installed
                  //   Dialogs.showToast(
                  //       'Please Install WhatsApp to use this feature');
                  // } else if (index == 0) {
                  //   Navigate.pushPage(
                  //       context, Downloads(title: '${category['title']}'));
                  // } else if (index == 5) {
                  //   Navigate.pushPage(context, AppScreen());
                  // } else {
                  //   Navigate.pushPage(
                  //     context,
                  //     index == 1 || index == 2
                  //         ? Images(title: '${category['title']}')
                  //         : Category(title: '${category['title']}'),
                  //   );
                  // }

                  switch (index) {
                    case 0:
                      Get.toNamed(AppRoutes.DOWNLOAD);
                      break;
                    case 1:
                      Get.toNamed(AppRoutes.IMAGE,
                          parameters: {"title": categories[index]['title']});
                      break;
                    case 2:
                      Get.toNamed(AppRoutes.IMAGE,
                          parameters: {"title": categories[index]['title']});
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
                  child: Icon(category['icon'],
                      size: 18, color: category['color']),
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
