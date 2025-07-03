import 'package:assesment/config/resources/constant/strings.dart';
import 'package:assesment/utils/common_widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../config/resources/colors/app_colors.dart';
import '../../config/resources/constant/assets.dart';

class AppNoDataFound extends StatelessWidget {
  String? title;
  String? subTitle;
  String iconPath;

  AppNoDataFound(
      {this.title,
        this.subTitle,
        this.iconPath = AppAssets.dataNotFound,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        children: [
          Image.asset(iconPath, width: 140, height: 140),
          20.verticalSpace,
          AppText(
            text: title ?? AppStringKey.oops.tr,
          ),
          10.verticalSpace,
          AppText(
            text: subTitle ??AppStringKey.noDataFound.tr,
            textAlign: TextAlign.center,
            textColor: AppColors.grey_1000,
          ),
        ],
      ),
    );
  }
}