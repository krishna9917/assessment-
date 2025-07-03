import 'package:assesment/config/resources/colors/app_colors.dart';
import 'package:assesment/config/resources/constant/screen_metrix.dart';
import 'package:assesment/config/resources/constant/strings.dart';
import 'package:assesment/config/routes/route_names.dart';
import 'package:assesment/data_source/api/models/employee.dart';
import 'package:assesment/screens/home/logic/controller.dart';
import 'package:assesment/utils/common_widgets/app_scaffold.dart';
import 'package:assesment/utils/common_widgets/app_text.dart';
import 'package:assesment/utils/utilities_functions/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        () =>
            (controller.state.employeesResponse.value.status ==
                        Status.COMPLETED ||
                    controller.state.employeesResponse.value.status ==
                        Status.ERROR) &&
                controller.state.employees.isEmpty
            ? Center(
                child: SingleChildScrollView(
                  child: AppNoDataFound(
                    iconPath: AppAssets.employee,
                    subTitle: AppStringKey.noEmployeeFound.tr,
                  ),
                ),
              )
            : ListView.builder(
                controller: controller.state.scrollController,
                itemCount:
                    controller.state.employeesResponse.value.status ==
                        Status.LOADING
                    ? controller.state.employees.length + 8
                    : controller.state.employees.length,
                itemBuilder: (context, index) => item(
                  context,
                  controller.state.employees.length - 1 < index
                      ? null
                      : controller.state.employees[index],
                ),
              ),
      ),
    );
  }

  item(BuildContext context, Employee? data) {
    return UtilFunctions.shimmer(
      enabled: data == null,
      child: GestureDetector(
        onTap: data != null
            ? () {
                Get.toNamed(
                  AppRoutes.employeeDetail,
                  arguments: data.toJson(),
                )?.then((value) {
                  controller.getLastOpenedEmpUsername();
                  controller.state.employees.refresh();
                });
              }
            : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          AppNetworkImage(
                            uri: data?.photo ?? "",
                            width: wpx(70),
                            height: hpx(70),
                            fit: BoxFit.cover,
                            circularRadius: rpx(100),
                          ),
                          20.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text:
                                      data?.name ??
                                      "--------------------------------",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                5.verticalSpace,
                                AppText(
                                  text:
                                      data?.username ??
                                      "--------------------------------",
                                ),
                                10.verticalSpace,
                                detailData(Icons.email, data?.email),
                                5.verticalSpace,
                                detailData(Icons.phone_android, data?.phone),
                                5.verticalSpace,
                                detailData(
                                  Icons.location_on_sharp,
                                  "${data?.address}, ${data?.state}, ${data?.country} ${data?.zip}",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Divider(thickness: 0.5),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Wrap(
                      children: [
                        controller.state.lastOpenedEmUsername == data?.username
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.primaryShade1000,
                                      AppColors.primaryShade900.withAlpha(40),
                                      AppColors.primaryShade900.withAlpha(10),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.electric_bolt, size: 10),
                                    2.horizontalSpace,
                                    AppText(
                                      text: AppStringKey.lastOpened.tr,
                                      fontSize: fpx(8),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  detailData(IconData icon, String? detail) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13),
        5.horizontalSpace,
        Expanded(
          child: AppText(
            text: detail ?? "------------------",
            textColor: AppColors.grey_1000,
          ),
        ),
      ],
    );
  }
}
