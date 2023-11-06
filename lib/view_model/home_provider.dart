import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:michine_test_webandcraft/model/employes_model.dart';
import 'package:michine_test_webandcraft/services/api_services.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    fetchData();
  }
  TextEditingController serachController = TextEditingController();
  final image =
      "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg";
  Box box = Hive.box('employee');
  List<EmployeesModel> employeeList = [];
  List<EmployeesModel> employeeListItems = [];
  bool isLoading = false;
  fetchData() async {
    if (box.isEmpty) {
      log("Get apiData");
      final response = await ApiService().getAllEmployees();
      if (response != null) {
        employeeList = employeesModelFromJson(jsonEncode(response));
        employeeListItems = employeeList;
        isLoading = true;

        await storeDataBase(response);
        notifyListeners();
      } else {
        log("response is null");
      }
    } else {
      log("Get storeDAta");
      employeeList = employeesModelFromJson(jsonEncode(box.values.toList()));
      employeeListItems = employeeList;
      isLoading = true;
      notifyListeners();
    }
  }

  Future storeDataBase(List employeList) async {
    await box.addAll(employeList);
    notifyListeners();
  }

  void filterSearchResults(String query) {
    employeeListItems = employeeList
        .where((item) => item.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
