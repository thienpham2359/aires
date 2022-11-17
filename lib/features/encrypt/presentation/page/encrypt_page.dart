import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/encrypt_controller.dart';

class EncryptPage extends GetView<EncryptController> {
  const EncryptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Encrypt & Decrypt Data"),
      ),
      body: SafeArea(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.textController,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: "Content",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 15),
                const Text("Encrypted text:"),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Text(controller.encryptedText.value),
                ),
                const SizedBox(height: 15),
                const Text("Decrypted text:"),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Text(controller.decryptedText.value),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => controller.encrypt(),
                      child: const Text("Encrypt"),
                    ),
                    ElevatedButton(
                      onPressed: () => controller.decrypt(),
                      child: const Text("Decrypt"),
                    )
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
