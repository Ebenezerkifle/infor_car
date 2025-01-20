import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infor_car/models/feul_model.dart';
import 'package:infor_car/providers/data_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class InfoAlertDialogModel extends ReactiveViewModel {
  final _dialog = locator<DialogService>();
  final _dataProvider = locator<DataProvider>();

  TextEditingController controller = TextEditingController();

  onSubmit() async {
    print('here we are');
    double? value = _manipulateValue(controller.text);
    print(value);
    if (value == null) return;
    setBusy(true);
    var data = FeulModel(value: value, feul: _dataProvider.feul);
    await _dataProvider.storeNewData(data);

    setBusy(false);
    _dialog.completeDialog(DialogResponse(confirmed: true));
  }

  _manipulateValue(value) {
    try {
      return double.parse(controller.text);
    } catch (e) {
      return null;
    }
  }

  onChange(value) {
    try {
      num v = num.parse(value);
      if (v > 100) {
        controller.clear();
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error2834: $e');
      }
    }
  }

  onClose() {
    _dialog.completeDialog(DialogResponse(confirmed: true));
  }
}
