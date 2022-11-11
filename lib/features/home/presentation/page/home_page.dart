import 'package:file_reader/core/route/app_routes.dart';
import 'package:file_reader/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.requestPermission();
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Reader"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () => Get.toNamed(AppRoutes.BROWSING),
                  child: const Text("File Browsing"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
