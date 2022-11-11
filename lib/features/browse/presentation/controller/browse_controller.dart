import 'dart:io';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/util/file/file_utils.dart';

class BrowseController extends GetxController {


  List<String> get downloadFiles  => <String>[].obs;

  void getDownloads() async {
    List<Directory> storages = await FileUtils.getStorageList();
    storages.forEach((dir) {
      if (Directory(dir.path + 'Download').existsSync()) {
        List<FileSystemEntity> files =
        Directory(dir.path + 'Download').listSync();
        print(files);
        files.forEach((file) {
          if (FileSystemEntity.isFileSync(file.path)) {
            downloadFiles.clear();
            downloadFiles.add(file.path.split('/')[file.path.split('/').length - 2]);
            print("File: ${file.path.split('/')[file.path.split('/').length - 2]}");
          }
        });
      }
    });
  }
}
