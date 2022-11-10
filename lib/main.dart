import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/route/app_pages.dart';
import 'core/ui/theme.dart';
import 'core/util/lang/translation_service.dart';

void main() {
  runApp(const FileReaderApp());
}


class FileReaderApp extends StatelessWidget {
  const FileReaderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: light(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
