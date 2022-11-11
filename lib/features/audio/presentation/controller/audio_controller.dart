import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:isolate_handler/isolate_handler.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart';

import '../../../../core/util/file/file_utils.dart';

class AudioController extends GetxController {
  final _audios = <FileSystemEntity>[].obs;

  RxList<FileSystemEntity?> get audios => _audios;
  final _loading = false.obs;

  RxBool get loading => _loading;

  final _isolates = IsolateHandler();

  @override
  void onInit() {
    super.onInit();
    switch (Get.parameters['title']?.toLowerCase()) {
      case 'audio':
        _getAudios('audio');
        break;
      case 'documents & others':
        _getAudios('text');
        break;
      default:
        break;
    }
  }

  void _getAudios(String type) async {
    _loading.value = true;
    _audios.clear();
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
    _port.listen((files) async {
      print('RECEIVED SERVER PORT');
      print(files);
      List tabs = await compute(separateAudios, {'files': files, 'type': type});
      _audios.value = tabs[0];
      _loading.value = false;
      _port.close();
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

  static Future<List> separateAudios(Map body) async {
    List files = body['files'];
    String type = body['type'];
    List<FileSystemEntity> audio = [];
    List<String> audioTabs = [];
    for (File file in files) {
      String mimeType = mime(file.path) ?? '';
      print(extension(file.path));
      if (type == 'text' && docExtensions.contains(extension(file.path))) {
        audio.add(file);
      }
      if (mimeType.isNotEmpty) {
        if (mimeType.split('/')[0] == type) {
          audio.add(file);
          audioTabs
              .add('${file.path.split('/')[file.path.split('/').length - 2]}');
          audioTabs = audioTabs.toSet().toList();
        }
      }
    }
    return [audio, audioTabs];
  }

  static List docExtensions = [
    '.pdf',
    '.epub',
    '.mobi',
    '.doc',
  ];
}
