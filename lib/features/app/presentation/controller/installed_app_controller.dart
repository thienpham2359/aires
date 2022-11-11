import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:isolate_handler/isolate_handler.dart';
import 'package:mime_type/mime_type.dart';

import '../../../../core/util/file/file_utils.dart';

class InstalledAppController extends GetxController {
  final _images = <FileSystemEntity>[].obs;
  RxList<FileSystemEntity?> get images => _images;
  final _loading = false.obs;
  RxBool get loading => _loading;

  final _isolates = IsolateHandler();

  @override
  void onInit() {
    super.onInit();
    if (Get.parameters['title']?.toLowerCase() == 'images') {
      _getImages('image');
    } else {
      _getImages('video');
    }
  }

  void _getImages(String type) async {
    _loading.value = true;
    _images.clear();
    String isolateName = type;
    _isolates.spawn<String>(
      getAllFilesWithIsolate,
      name: isolateName,
      onReceive: (val) {
        print(val);
        _isolates.kill(isolateName);
      },
      onInitialized: () => _isolates.send('hey', to: isolateName),
    );
    ReceivePort _port = ReceivePort();
    IsolateNameServer.registerPortWithName(_port.sendPort, '${isolateName}_2');
    _port.listen((files) {
      print('RECEIVED SERVER PORT');
      print(files);
      files.forEach((file) {
        String mimeType = mime(file.path) ?? '';
        if (mimeType.split('/')[0] == type) {
          _images.add(file);
        }
      });
      _port.close();
      _loading.value = false;
      IsolateNameServer.removePortNameMapping('${isolateName}_2');
    });
  }

  static getAllFilesWithIsolate(Map<String, dynamic> context) async {
    print(context);
    String isolateName = context['name'];
    print('Get files');
    List<FileSystemEntity> files =
        await FileUtils.getAllFiles(showHidden: false);
    print('Files $files');
    final messenger = HandledIsolate.initialize(context);
    try {
      final SendPort? send =
          IsolateNameServer.lookupPortByName('${isolateName}_2');
      send!.send(files);
    } catch (e) {
      print(e);
    }
    messenger.send('done');
  }
}
