import 'package:assesment/data_source/repositories/employee_repo.dart';
import 'package:assesment/local_storage/shared_preference/instance.dart';
import 'package:assesment/screens/home/logic/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data_source/api/models/employee.dart';
import '../../../data_source/api/network/response/response.dart';
import '../../../data_source/api/network/response/status.dart';

class HomeController extends GetxController {
  final EmployeeRepository _employeeRepository = EmployeeRepository();
  final HomeState state = HomeState();

  @override
  void onInit() {
    super.onInit();
    getLastOpenedEmpUsername();
    fetchData();
    state.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    state.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void fetchData({int page = 1}) {
    _employeeRepository.getEmployee((ApiResponse<List<Employee>> response) {
      state.employeesResponse.value = response;
      if (response.status == Status.COMPLETED) {
        if (page == 1) {
          state.employees.clear();
        }
        state.employees.addAll(state.employeesResponse.value.data ?? []);
      }
      state.currentPage.value = page;
    }, page: page);
  }

  void _onScroll() {
    if (state.scrollController.position.pixels >=
            state.scrollController.position.maxScrollExtent - 200 &&
        state.employeesResponse.value.status != Status.LOADING &&
        state.employees.length <= state.currentPage.value * 10) {
      fetchData(page: state.currentPage.value + 1);
    }
  }

  void getLastOpenedEmpUsername() {
    state.lastOpenedEmUsername.value = SharedPreferenceInstance.to.getString(
      SharedPreferenceInstance.keyLastOpenedEmUserName,
    );
  }
}
