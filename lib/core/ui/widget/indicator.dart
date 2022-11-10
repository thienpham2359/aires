import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const Indicator({Key? key, required this.isActive, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isActive ? 10 : 8,
        height: isActive ? 10 : 8,
        decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
