import 'package:flutter/material.dart';

const defaultPadding = 20.0;

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

const List categories = [
  {
    'title': 'Documents',
    'icon': Icons.file_copy_outlined,
    'path': '',
    'color': Colors.pink
  },
];

const List importOtps = [
  {
    'title': 'Gallery',
    'icon': Icons.image,
  },
  {
    'title': 'Take photo',
    'icon': Icons.image,
  },{
    'title': 'Take video',
    'icon': Icons.video_camera_back,
  },
  {
    'title': 'File manager',
    'icon':Icons.file_copy_outlined,
  },
];
