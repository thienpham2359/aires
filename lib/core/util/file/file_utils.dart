import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart';


class FileUtils {

  static String waPath = '/storage/emulated/0/WhatsApp/Media/.Statuses';

  /// Convert Byte to KB, MB, .......
  static String formatBytes(bytes, decimals) {
    if (bytes == 0) return '0.0 KB';
    var k = 1024,
        dm = decimals <= 0 ? 0 : decimals,
        sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
        i = (log(bytes) / log(k)).floor();
    return (((bytes / pow(k, i)).toStringAsFixed(dm)) + ' ' + sizes[i]);
  }

  /// Return all available Storage path
  static Future<List<Directory>> getStorageList() async {
    List<Directory> paths = (await getExternalStorageDirectories())!;
    List<Directory> filteredPaths = <Directory>[];
    for (Directory dir in paths) {
      filteredPaths.add(removeDataDirectory(dir.path));
    }
    return filteredPaths;
  }

  static Directory removeDataDirectory(String path) {
    return Directory(path.split('Android')[0]);
  }
}
