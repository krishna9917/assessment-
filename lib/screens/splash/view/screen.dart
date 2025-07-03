import 'package:assesment/config/resources/constant/assets.dart';
import 'package:assesment/screens/splash/logic/controller.dart';
import 'package:assesment/utils/common_widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    controller.moveForward();
    return AppScaffold(child: Center(child: Image.asset(AppAssets.logo),));
  }
}
