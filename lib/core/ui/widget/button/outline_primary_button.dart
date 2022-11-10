import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import '../hover_widget.dart';

class OutlinePrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? scale;

  const OutlinePrimaryButton(
      {Key? key, this.scale, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
        scale: scale,
        builder: (isHovered) {
          return InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: isHovered ? primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: primaryColor, width: 1)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 30.0,
                ),
                child: Center(
                  child: Text(
                    text,
                    style: Theme.of(Get.context!).textTheme.headline1?.copyWith(
                        color: isHovered ? Colors.white : primaryColor,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
