import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infor_car/ui/common/app_colors.dart';
import 'package:infor_car/ui/common/app_text_style.dart';
import 'package:infor_car/ui/common/ui_helpers.dart';
import 'package:infor_car/ui/views/widgets/custome_button/custome_button.dart';
import 'package:infor_car/ui/views/widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'info_alert_dialog_model.dart';

class InfoAlertDialog extends StackedView<InfoAlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InfoAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InfoAlertDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(request.title!, style: bold),
                            verticalSpaceTiny,
                            InputField(
                                controller: viewModel.controller,
                                onchange: (value) => viewModel.onChange(value),
                                hint: '50 %',
                                charLength: 3,
                                inputFormatter: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'))
                                ])
                          ]))
                    ]),
                verticalSpaceMedium,
                CustomeButton(
                  text: 'Submit',
                  onTap: viewModel.onSubmit,
                  loading: viewModel.isBusy,
                  btnColor: primaryDarkColor,
                )
              ],
            ),
          ),
          Positioned(
              child: IconButton(
            onPressed: viewModel.onClose,
            icon: const Icon(FontAwesomeIcons.circleXmark),
          ))
        ],
      ),
    );
  }

  @override
  InfoAlertDialogModel viewModelBuilder(BuildContext context) =>
      InfoAlertDialogModel();
}
