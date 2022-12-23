import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:drag_and_drop_windows/drag_and_drop_windows.dart' as dd;

import '../../../../core/util/file/file_utils.dart';

class DocumentController extends GetxController {
  final _documentFiles = <FileSystemEntity>[].obs;

  RxList<FileSystemEntity?> get documentFiles => _documentFiles;

  final _loading = false.obs;

  RxBool get loading => _loading;

  StreamSubscription? _subscription;

  @override
  void onInit() {
    super.onInit();
    _getDownloads();

    if (Platform.isWindows){
      _subscription ??= dd.dropEventStream.listen((paths) async {
        for (var path in paths) {
          final File file = File(path);
          await _moveFileToDocumentFolder(file);
        }
        _getDownloads();
      });
    }
  }

  Future _getDownloads() async {
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

  void pickFiles(FileType type) async {
    try {
      final paths = (await FilePicker.platform.pickFiles(
        type: type,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: null,
      ))
          ?.files;

      final File file = File(paths![0].path ?? "");
      _moveFileToDocumentFolder(file);
      _getDownloads();
    } on PlatformException catch (e) {
      print('Unsupported operation' + e.toString());
    } catch (e) {
      print(e);
    }
  }

  void pickImage(ImageSource source) async {
    try {
      final imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(source: source);
      final file = File(image?.path ?? "");
      _moveFileToDocumentFolder(file);
      _getDownloads();
    } catch (e) {
      print(e);
    }
  }

  void pickVideo(ImageSource source) async {
    try {
      final imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickVideo(source: source);
      final file = File(image?.path ?? "");
      _moveFileToDocumentFolder(file);
      _getDownloads();
    } catch (e) {
      print(e);
    }
  }


  void deleteFile(FileSystemEntity file) async {
    file.deleteSync();
    _getDownloads();
  }

  Future _moveFileToDocumentFolder(File file) async {
    var basNameWithExtension = path.basename(file.path);
    Directory directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/$basNameWithExtension";
    print(filePath);
    await _moveFile(file, filePath);
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
