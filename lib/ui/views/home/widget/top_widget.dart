import 'package:flutter/material.dart';
import 'package:infor_car/ui/views/widgets/curved_container.dart';
import 'package:infor_car/ui/views/widgets/icon_decore_widget.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_text_style.dart';
import '../../../common/ui_helpers.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CurvedContainer(
              color: secondaryColor,
              vPadding: smallSize,
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                Icon(Icons.location_pin, color: errorColor),
                horizontalSpaceTiny,
                Expanded(
                    child: Text('Addis Ababa, Ethiopia',
                        style: regular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis)),
                Icon(Icons.arrow_drop_down),
              ]),
            )
          ]),
        ),
        horizontalSpaceMedium,
        IconDecoreWidget(icon: Icons.notifications, onTap: () {})
      ],
    );
  }
}
