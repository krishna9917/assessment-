import 'package:assesment/data_source/api/models/employee.dart';
import 'package:assesment/data_source/api/network/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeState {
  Rx<ApiResponse<Employee>> employeesResponse =
      ApiResponse<Employee>.initial().obs;


}
