import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:michine_test_webandcraft/services/api_endpoints.dart';

class ApiService {
  Dio dio = Dio();
  // ignore: body_might_complete_normally_nullable
  Future<List?> getAllEmployees() async {
    try {
      Response response =
          await dio.get(ApiEndPoints().baseurl + ApiEndPoints().employee);
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data;
      }
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      } else {
        log("1");
        log(e.toString());
      }
      return [];
    }
  }
}
