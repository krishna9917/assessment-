import 'package:assesment/data_source/api/models/employee.dart';
import 'package:assesment/data_source/api/network/response/response.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeState {
  Rx<ApiResponse<List<Employee>>> employeesResponse = ApiResponse<List<Employee>>.initial().obs;
  RxList<Employee> employees = <Employee>[].obs;
  final scrollController = ScrollController();
  final currentPage = 1.obs;

}
