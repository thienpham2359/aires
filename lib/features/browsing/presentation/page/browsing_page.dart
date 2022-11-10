import 'package:file_reader/features/browsing/presentation/controller/browsing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowsingPage extends GetView<BrowsingController> {
  const BrowsingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Browsing"),
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
