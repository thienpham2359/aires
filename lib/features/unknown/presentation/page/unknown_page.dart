import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/unknown_controller.dart';

class UnknownPage extends GetView<UnknownController> {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not Found"),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Page Not Found"),
        ),
      ),
    );
  }
}
