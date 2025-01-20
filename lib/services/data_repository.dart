import 'package:http/http.dart';
import 'package:infor_car/services/api_call_service.dart';

import 'api_constants.dart';

class DataRepository {
  // store data.
  static Future<Response> storeVehicleData(var data) {
    String url = '$baseUrl$vehicleUrl$createUrl';
    return ApiCallService.postCall(url, data, needToken: false);
  }

  // get dashboard data.
  static Future<Response> getDashboardData() {
    String url = '$baseUrl$vehicleUrl$dashboardUrl';
    return ApiCallService.getCall(url, needToken: false);
  }

  // get graph data.
  static Future<Response> getGraphData() {
    String url = '$baseUrl$vehicleUrl$graphUrl';
    return ApiCallService.getCall(url, needToken: false);
  }
}
