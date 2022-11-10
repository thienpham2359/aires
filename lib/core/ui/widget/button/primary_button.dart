import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import '../hover_widget.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? scale;

  const PrimaryButton({Key? key, required this.text, this.onTap, this.scale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
        scale: scale,
        builder: (_) {
          return InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 30.0,
                ),
                child: Center(
                  child: Text(
                    text,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .headline1
                        ?.copyWith(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
