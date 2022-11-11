import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../../../../core/ui/widget/file_icon.dart';
import '../../../../core/util/file/file_utils.dart';

class MediaTile extends StatelessWidget {
  final File file;
  final String mimeType;

  const MediaTile({super.key, required this.file, required this.mimeType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => OpenFile.open(file.path),
      child: GridTile(
        header: Container(
          height: 50,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black54, Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: mimeType.split('/')[0] == 'video'
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          FileUtils.formatBytes(file.lengthSync(), 1),
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.play_circle_filled,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    )
                  : Text(
                      '${FileUtils.formatBytes(file.lengthSync(), 1)}',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
            ),
          ),
        ),
        child: mimeType.split('/')[0] == 'video'
            ? FileIcon(file: file)
            : Image(
                fit: BoxFit.cover,
                errorBuilder: (b, o, c) {
                  return Icon(Icons.image);
                },
                image: ResizeImage(
                  FileImage(File(file.path)),
                  width: 150,
                  height: 150,
                ),
              ),
      ),
    );
  }
}
