import 'dart:io';

import 'package:get/get.dart';

import '../../../../core/util/file/file_utils.dart';

class DownloadController extends GetxController {
  final _downloadFiles = <FileSystemEntity>[].obs;
  RxList<FileSystemEntity?> get downloadFiles => _downloadFiles;

  final _loading = false.obs;
  RxBool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    getDownloads();
  }

  void getDownloads() async {
    _loading.value = true;
    _downloadFiles.clear();

    List<Directory> storages = await FileUtils.getStorageList();
    for (var dir in storages) {
      if (Directory('${dir.path}Download').existsSync()) {
        List<FileSystemEntity> files =
            Directory('${dir.path}Download').listSync();
        for (var i = 0; i < files.length; i++) {
          final file = files[i];
          if (FileSystemEntity.isFileSync(file.path)) {
            _downloadFiles.add(file);
            print(downloadFiles.length);
          }
        }
      }
    }

    _loading.value = false;
  }
}
