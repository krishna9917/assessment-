import 'package:assesment/screens/detail/logic/controller.dart';
import 'package:get/get.dart';

class EmployeeDetailBinding extends Bindings {
  @override
  void dependencies() {
    return Get.lazyPut(() => EmployeeDetailController());
  }
}
