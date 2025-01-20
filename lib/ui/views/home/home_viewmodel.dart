import 'package:infor_car/app/app.dialogs.dart';
import 'package:infor_car/providers/data_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class HomeViewModel extends ReactiveViewModel {
  final _dialog = locator<DialogService>();
  final _dataProvider = locator<DataProvider>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_dataProvider];

  HomeViewModel() {
    _init();
  }

  get feulValue => _dataProvider.feulData.value;
  get batteryValue => _dataProvider.batteryData.value;

  onRefresh() async => await _init();

  _init() async {
    setBusy(true);
    await _dataProvider.getDashboardData();
    setBusy(false);
  }

  onAddData(bool dataType) {
    _dataProvider.setCurrentData(dataType);
    _dialog.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Add Feul Level',
    );
  }
}
