import 'dart:io';

import 'package:get/get.dart';

import '../../../../core/util/file/file_utils.dart';

class DocumentController extends GetxController {
  final _documentFiles = <FileSystemEntity>[].obs;
  RxList<FileSystemEntity?> get documentFiles => _documentFiles;

  final _loading = false.obs;
  RxBool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    getDownloads();
  }

  void getDownloads() async {
    _loading.value = true;
    _documentFiles.clear();

    List<Directory> storages = await FileUtils.getDocumentList();
    for (var dir in storages) {
      if (Directory('${dir.path}').existsSync()) {
        List<FileSystemEntity> files =
            Directory('${dir.path}').listSync();
        for (var i = 0; i < files.length; i++) {
          final file = files[i];
          if (FileSystemEntity.isFileSync(file.path)) {
            _documentFiles.add(file);
          }
        }
      }
    }

    _loading.value = false;
  }
}
