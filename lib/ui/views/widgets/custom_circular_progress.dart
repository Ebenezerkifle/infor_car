import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infor_car/ui/common/app_colors.dart';

import '../../common/app_text_style.dart';
import '../../common/ui_helpers.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    super.key,
    this.value = 0,
    this.size,
    this.stroke,
    this.textStyle,
  });
  final double? value;
  final double? size;
  final double? stroke;
  final TextStyle? textStyle;

  Color colorProvider(double value) {
    if (value > .8) {
      return Colors.green[900] ?? Colors.green;
    } else if (value > .65) {
      return Colors.yellow[700] ?? Colors.yellow;
    } else if (value > .35) {
      return Colors.orange[700] ?? Colors.orange;
    }
    return Colors.red[700] ?? Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: value),
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        builder: (context, v, child) {
          double vv = v / 100;
          return Row(children: [
            SizedBox(
              height: size ?? 30,
              width: size ?? 30,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: vv,
                    backgroundColor: grey40Color,
                    color: colorProvider(vv),
                    strokeWidth: stroke ?? 6,
                  ),
                  if (vv == 1.0)
                    Icon(
                      FontAwesomeIcons.check,
                      size: (size ?? 30) * .5,
                      color: colorProvider(vv),
                    )
                ],
              ),
            ),
            horizontalSpaceMiddle,
            SizedBox(
                width: 80,
                child: Text('${v.toStringAsFixed(0)}%',
                    style: textStyle ??
                        bold.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryDarkColor)))
          ]);
        });
  }
}
