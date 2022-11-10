import 'package:flutter/material.dart';

class HoverWidget extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  final double? scale;

  const HoverWidget({Key? key, this.scale = 1.2, required this.builder}) : super(key: key);

  @override
  State<HoverWidget> createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale:  isHovered ? widget.scale ?? 1.2 : 1.0,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
