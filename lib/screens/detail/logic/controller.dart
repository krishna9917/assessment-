import 'package:assesment/data_source/api/models/employee.dart';
import 'package:assesment/local_storage/shared_preference/instance.dart';
import 'package:assesment/screens/detail/logic/state.dart';
import 'package:get/get.dart';

class EmployeeDetailController extends GetxController {
  final state = EmployeeDetailState();

  @override
  void onInit() {
    super.onInit();
    getDetailOfEmployee();
  }

  void getDetailOfEmployee() async {
    state.employeeDetail.value = Employee.fromJson(
      Get.arguments as Map<String, dynamic>,
    );
    await SharedPreferenceInstance.to.setString(
      SharedPreferenceInstance.keyLastOpenedEmUserName,
      state.employeeDetail.value.username.toString(),
    );
  }
}
