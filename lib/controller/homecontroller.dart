import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/employee_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    employeedetails();
  }

  List<Employee> employeeList = [];
  bool load = true;

  employeedetails() async {
    load = true;
    update();
    var url = Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986');
    http.Response response = await http.get(url);
    log(response.body);
    var json = response.body;
    employeeList = employeeFromJson(json);
    load = false;
    update();
  }
}
