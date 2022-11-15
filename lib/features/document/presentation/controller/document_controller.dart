import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../../../core/util/file/file_utils.dart';

class DocumentController extends GetxController {
  final _documentFiles = <FileSystemEntity>[].obs;

  RxList<FileSystemEntity?> get documentFiles => _documentFiles;

  final _loading = false.obs;

  RxBool get loading => _loading;

  List<PlatformFile>? _paths;
  final FileType _pickingType = FileType.any;

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
        List<FileSystemEntity> files = Directory('${dir.path}').listSync();
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

  void pickFiles() async {
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: null,
      ))?.files;

      final File file = File(_paths![0].path ?? "");
      var basNameWithExtension = path.basename(file.path);

      Directory directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/$basNameWithExtension";
      print(filePath);
      _moveFile(file, filePath);

    } on PlatformException catch (e) {
      print('Unsupported operation' + e.toString());
    } catch (e) {
      print(e);
    }
  }

  void deleteFile(FileSystemEntity file) async {
    file.deleteSync();
    getDownloads();
  }

  Future<File> _moveFile(File sourceFile, String newPath) async {
    try {
      return await sourceFile.rename(newPath);
    } catch (e) {
      final newFile = await sourceFile.copy(newPath);
      return newFile;
    }
  }
}
