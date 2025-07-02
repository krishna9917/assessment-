import 'package:assesment/screens/home/logic/controller.dart';
import 'package:get/get.dart';
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
