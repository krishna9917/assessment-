import 'package:assesment/data_source/repositories/employee_repo.dart';
import 'package:assesment/screens/home/logic/state.dart';
import 'package:get/get.dart';
import '../../../data_source/api/models/employee.dart';
import '../../../data_source/api/network/response/response.dart';

class HomeController extends GetxController {
  final EmployeeRepository _employeeRepository = EmployeeRepository();
  final HomeState state = HomeState();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData({int page=1}) {
    _employeeRepository.getEmployee((ApiResponse<Employee> response) {
      state.employeesResponse.value = response;
    }, page: page);
  }
}
