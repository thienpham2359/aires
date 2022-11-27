import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
    'icon': Feather.file,
    'path': '',
    'color': Colors.pink
  },
];

const List importOtps = [
  {
    'title': 'Gallery',
    'icon': Feather.image,
  },
  {
    'title': 'Take photo',
    'icon': Feather.image,
  },{
    'title': 'Take video',
    'icon': Feather.video,
  },
  {
    'title': 'File manager',
    'icon': Feather.file,
  },
];
