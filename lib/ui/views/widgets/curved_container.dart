import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({
    super.key,
    required this.child,
    this.color,
    this.vPadding,
    this.hPadding,
    this.width,
    this.border,
    this.borderColor,
    this.roundness,
    this.gradiant,
    this.onTap,
    this.height,
    this.strokeSize,
  });
  final Widget child;
  final Color? color;
  final double? vPadding;
  final double? hPadding;
  final double? width;
  final bool? border;
  final Color? borderColor;
  final double? roundness;
  final LinearGradient? gradiant;
  final VoidCallback? onTap;
  final double? height;
  final double? strokeSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.symmetric(
                horizontal: hPadding ?? 10, vertical: vPadding ?? 5),
            decoration: BoxDecoration(
                gradient: gradiant,
                borderRadius: BorderRadius.circular(roundness ?? 50),
                color: color ?? Colors.white,
                border: border ?? false
                    ? Border.all(
                        color: borderColor ?? Colors.black,
                        width: strokeSize ?? 2)
                    : null),
            alignment: Alignment.center,
            child: child));
  }
}
