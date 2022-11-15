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
    'title': 'Downloads',
    'icon': Feather.download,
    'path': '',
    'color': Colors.purple
  },
  {
    'title': 'Images',
    'icon': Feather.image,
    'path': '',
    'color': Colors.blue
  },
  {'title': 'Videos', 'icon': Feather.video, 'path': '', 'color': Colors.red},
  {
    'title': 'Audio',
    'icon': Feather.headphones,
    'path': '',
    'color': Colors.teal
  },
  {
    'title': 'Documents & Others',
    'icon': Feather.file,
    'path': '',
    'color': Colors.pink
  },
  {'title': 'Apps', 'icon': Icons.android, 'path': '', 'color': Colors.green},
];

const List iOSCategories = [
  {
    'title': 'Documents',
    'icon': Feather.file,
    'path': '',
    'color': Colors.pink
  },
];

