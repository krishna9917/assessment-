import 'package:assesment/config/routes/route_names.dart';
import 'package:assesment/screens/home/logic/binding.dart';
import 'package:assesment/screens/home/view/screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../screens/splash/logic/binding.dart';
import '../../screens/splash/view/screen.dart';

class AppPages {
  static const initialRoute = AppRoutes.initialRoute;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.initialRoute,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.homeRoute,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
