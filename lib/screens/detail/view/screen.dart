import 'package:assesment/config/resources/constant/strings.dart';
import 'package:assesment/screens/detail/logic/controller.dart';
import 'package:assesment/utils/common_widgets/app_title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/resources/colors/app_colors.dart';
import '../../../config/resources/constant/screen_metrix.dart';
import '../../../utils/common_widgets/app_network_image.dart'
    show AppNetworkImage;
import '../../../utils/common_widgets/app_scaffold.dart';
import '../../../utils/common_widgets/app_text.dart';

class EmployeeDetail extends GetView<EmployeeDetailController> {
  const EmployeeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppTitleBar(
        title: controller.state.employeeDetail.value.name ?? "",
      ),
      child: SingleChildScrollView(
        child: Obx(() {
          final data = controller.state.employeeDetail.value;
          return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  children: [
                    AppNetworkImage(
                      uri: data.photo ?? "",
                      width: wpx(200),
                      height: hpx(200),
                      fit: BoxFit.cover,
                      circularRadius: rpx(100),
                    ),
                  ],
                ),
                30.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text:
                          "Hii 👋, this is ${data.name} (@${data.username}) and come from ${data.address}, ${data.state}, ${data.country} ${data.zip}",
                    ),
                    20.verticalSpace,
                    AppText(
                      text: "👉 ${AppStringKey.catchMeByGivenDetails.tr}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    30.verticalSpace,
                    detailData(Icons.email, data.email),
                    20.verticalSpace,
                    detailData(Icons.phone_android, data.phone),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  detailData(IconData icon, String? detail) {
    return Row(
      children: [
        Icon(icon),
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
