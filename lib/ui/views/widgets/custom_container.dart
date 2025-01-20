import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.child,
    this.padding,
    this.onTap,
    this.width,
    this.color,
    this.storkSize,
    this.duration,
  });
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final double? width;
  final Color? color;
  final double? storkSize;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        highlightColor: secondaryColor,
        borderRadius: BorderRadius.circular(middleSize),
        child: AnimatedContainer(
            curve: Easing.emphasizedAccelerate,
            duration: duration ?? const Duration(seconds: 1),
            width: width,
            padding: padding ?? const EdgeInsets.all(smallSize),
            decoration: BoxDecoration(
              color: color ?? whiteColor.withOpacity(.3),
              borderRadius: BorderRadius.circular(middleSize),
              border: Border.all(width: storkSize ?? .05),
            ),
            child: child));
  }
}
