import 'package:assesment/screens/home/logic/controller.dart';
import 'package:assesment/utils/common_widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: ListView.builder(itemBuilder: (context, index) => Container()),
    );
  }
}
