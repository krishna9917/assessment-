import 'package:assesment/config/resources/constant/screen_metrix.dart';
import 'package:assesment/config/resources/constant/strings.dart';
import 'package:assesment/data_source/api/models/employee.dart';
import 'package:assesment/screens/home/logic/controller.dart';
import 'package:assesment/utils/common_widgets/app_scaffold.dart';
import 'package:assesment/utils/utilities_functions/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/resources/constant/assets.dart';
import '../../../data_source/api/network/response/status.dart';
import '../../../utils/common_widgets/app_network_image.dart';
import '../../../utils/common_widgets/app_no_data_found.dart';
import '../../../utils/common_widgets/app_title_bar.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppTitleBar(title: AppStringKey.home.tr),
      child: Obx(
        () => (controller.state.employeesResponse.value.status ==
            Status.COMPLETED ||
            controller.state.employeesResponse.value.status ==
                Status.ERROR) &&
            (controller.state.employeesResponse.value.data?.isEmpty??true)? Center(
          child: SingleChildScrollView(
            child: AppNoDataFound(
              iconPath: AppAssets.employee,
              subTitle: AppStringKey.noEmployeeFound.tr,
            ),
          ),
        ) :ListView.builder(
          controller: controller.state.scrollController,
          itemCount:
          controller.state.employeesResponse.value.status ==
              Status.LOADING
              ? controller.state.employees.length + 8 : controller.state.employees.length,
          itemBuilder: (context, index) => item(context,controller.state.employees.length-1<index?null:controller.state.employees[index]),
        ),
      ),
    );
  }

  item(BuildContext context,Employee? data) {
    return UtilFunctions.shimmer(
      enabled: data==null,
      child: Column(children: [
        Row(children: [
          AppNetworkImage(uri: data?.photo??"",width: wpx(100),height: hpx(100),)
        ],)
      ],),
    );
  }
}
