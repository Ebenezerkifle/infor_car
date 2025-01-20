import 'dart:convert';

import 'package:infor_car/models/feul_model.dart';
import 'package:infor_car/services/api_call_service.dart';
import 'package:infor_car/services/data_repository.dart';
import 'package:stacked/stacked.dart';

class DataProvider with ListenableServiceMixin {
  DataProvider() {
    listenToReactiveValues(
        [_feulData, _batteryData, _feulGraph, _batteryGraph]);
  }

  final _feulData = ReactiveValue(FeulModel());
  final _batteryData = ReactiveValue(FeulModel());

  final _feulGraph = ReactiveList<GraphModel>();
  final _batteryGraph = ReactiveList<GraphModel>();

  FeulModel get feulData => _feulData.value;
  FeulModel get batteryData => _batteryData.value;

  List<GraphModel> get feulGraph => _feulGraph;
  List<GraphModel> get batteryGraph => _batteryGraph;

  final _feul = ReactiveValue(false);
  bool get feul => _feul.value;

  setCurrentData(bool value) {
    _feul.value = value;
    notifyListeners();
  }

  // store new data.
  storeNewData(FeulModel data) async {
    var response = await DataRepository.storeVehicleData(data.toMap());
    if (statusCodeSuccess(response.statusCode)) {
      _refresh();
    }
  }

  _refresh() {
    getDashboardData();
    getGraphData();
  }

  // get dashboard data.
  getDashboardData() async {
    var response = await DataRepository.getDashboardData();
    var data = jsonDecode(response.body)['data'];
    if (statusCodeSuccess(response.statusCode)) {
      var feul = data['feulLevel'] as List<dynamic>;
      if (feul.isNotEmpty) {
        _feulData.value = FeulModel.fromMap(feul[0]);
      }
      var battery = data['batteryLevel'] as List<dynamic>;
      if (battery.isNotEmpty) {
        _batteryData.value = FeulModel.fromMap(battery[0]);
      }
    }
    notifyListeners();
  }

  // get graph data.
  getGraphData() async {
    var response = await DataRepository.getGraphData();
    if (statusCodeSuccess(response.statusCode)) {
      var data = jsonDecode(response.body)['data'];
      var feulGraph = data['feulGraph'];
      var batteryGraph = data['batteryGraph'];
      List<GraphModel> feulList = [];
      List<GraphModel> batteryList = [];
      for (var ele in feulGraph) {
        var fG = GraphModel.fromMap(ele);
        feulList.add(fG);
      }
      for (var ele in batteryGraph) {
        var bG = GraphModel.fromMap(ele);
        batteryList.add(bG);
      }
      _feulGraph.clear();
      _batteryGraph.clear();
      _feulGraph.addAll(feulList);
      _batteryGraph.addAll(batteryList);
      notifyListeners();
    }
  }
}
