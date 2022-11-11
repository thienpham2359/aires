import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';

import '../ui/widget/file_icon.dart';
import 'file/file_utils.dart';
import 'file_popup.dart';

class FileItem extends StatelessWidget {
  final FileSystemEntity file;
  final Function? popTap;

  FileItem({
    Key? key,
    required this.file,
    this.popTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => OpenFile.open(file.path),
      contentPadding: const EdgeInsets.only(left: 20),
      leading: FileIcon(file: file),
      title: Text(
        '${basename(file.path)}',
        style: TextStyle(fontSize: 14),
        maxLines: 2,
      ),
      subtitle: Text(
        '${FileUtils.formatBytes(File(file.path).lengthSync(), 2)},'
        ' ${FileUtils.formatTime(File(file.path).lastModifiedSync().toIso8601String())}',
      ),
      trailing:
          popTap == null ? null : FilePopup(path: file.path, popTap: popTap!),
    );
  }
}
