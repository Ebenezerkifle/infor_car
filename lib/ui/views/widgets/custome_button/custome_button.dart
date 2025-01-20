import 'package:flutter/material.dart';
import '../../../common/app_text_style.dart';
import '../../../common/ui_helpers.dart';
import 'loading.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({
    super.key,
    required this.text,
    required this.onTap,
    this.btnColor,
    this.textColor,
    this.height = 50,
    this.width,
    this.stroke = false,
    this.round = false,
    this.stkWidth = 2,
    this.textStyle,
    this.alignment,
    this.icon,
    this.disabled = false,
    required this.loading,
    this.iconOnly = false,
    this.bgdColor,
  });
  final bool stroke;
  final String text;
  final VoidCallback onTap;
  final Color? btnColor;
  final Color? textColor;
  final double height;
  final double? width;
  final bool round;
  final double stkWidth;
  final TextStyle? textStyle;
  final Widget? icon;
  final MainAxisAlignment? alignment;
  final bool disabled;
  final bool loading;
  final bool iconOnly;
  final Color? bgdColor;
  @override
  Widget build(BuildContext context) {
    Color primaryColor = btnColor ?? Theme.of(context).primaryColor;
    Color whiteColor = textColor ?? Colors.white;
    return SizedBox(
      height: height,
      width: width, //?? MediaQuery.of(context).size.width * .5,
      child: ElevatedButton(
        onPressed: disabled || loading
            ? () {}
            : () => {
                  FocusScope.of(context).unfocus(),
                  onTap(),
                },
        style: ElevatedButton.styleFrom(
          foregroundColor: whiteColor,
          backgroundColor: stroke
              ? bgdColor ?? whiteColor
              : disabled
                  ? primaryColor // you can change this
                  : bgdColor ?? primaryColor,
          side: stroke
              ? BorderSide(
                  color: primaryColor,
                  width: stkWidth,
                  strokeAlign: BorderSide.strokeAlignInside)
              : BorderSide.none,
          shape: round
              ? const StadiumBorder()
              : const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(smallSize)),
                ),
        ),
        child: Row(
          mainAxisAlignment: alignment ?? MainAxisAlignment.center,
          children: [
            loading
                ? Row(
                    children: [
                      horizontalSpaceSmall,
                      SizedBox(
                        width: middleSize,
                        height: middleSize,
                        child: LoadingWidget(
                            color: stroke ? primaryColor : textColor),
                      ),
                    ],
                  )
                : iconOnly
                    ? icon ?? Container()
                    : Row(
                        children: [
                          if (icon != null) ...[icon!, horizontalSpaceSmall],
                          Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                            style: textStyle ??
                                bold.copyWith(
                                  fontSize: 14,
                                  color: stroke
                                      ? textColor ?? primaryColor
                                      : whiteColor,
                                ),
                          ),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
