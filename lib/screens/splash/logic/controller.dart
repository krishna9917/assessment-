import 'package:assesment/config/routes/route_names.dart';
import 'package:get/get.dart';
class SplashController extends GetxController {


  void moveForward() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.offNamed(AppRoutes.home);
    });
  }

}
