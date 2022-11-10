import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en.dart';
import 'vi.dart';

class TranslationService extends Translations {

  static Locale? get locale => Get.deviceLocale;

  static const fallbackLocale = Locale("en", "US");

  @override
  Map<String, Map<String, String>> get keys => {
    'vi_VN': vi,
    "en_US": en
  };
}
