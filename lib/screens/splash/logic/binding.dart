import 'package:assesment/screens/splash/logic/controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SplashController());
  }

}