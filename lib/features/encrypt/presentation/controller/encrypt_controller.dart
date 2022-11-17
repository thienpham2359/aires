import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/encrypt/encrypt_data.dart';

class EncryptController extends GetxController {
  final _textController = TextEditingController();

  TextEditingController get textController => _textController;

  final _encryptedText = "".obs;

  RxString get encryptedText => _encryptedText;

  final _decryptedText = "".obs;

  RxString get decryptedText => _decryptedText;

  void encrypt() {
    try {
      final plainText = _textController.text;
      if (plainText != "") {
        final encryptedText = EncryptData.encryptAES(plainText);
        _encryptedText.value = encryptedText;
      } else {
        _showError("Please enter the content");
      }
    } catch (e) {
      print(e);
    }
  }

  void decrypt() {
    try {
      final plainText = _encryptedText.value;
      if (plainText != "") {
        final decryptedText = EncryptData.decryptAES(plainText);
        _decryptedText.value = decryptedText;
      } else {
        _showError("Please enter the content");
      }
    } catch (e) {
      print(e);
    }
  }

  _showError(String message) {
    Get.showSnackbar(GetSnackBar(
      snackStyle: SnackStyle.GROUNDED,
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.lightBlue,
    ));
  }
}
