import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../config/resources/colors/app_colors.dart';

class UtilFunctions {
  static showSnackBar(String message, {bool isError = false}) {
    Get.snackbar(
      "",
      message,
      titleText: SizedBox.shrink(),
      colorText: AppColors.white,
      backgroundColor: isError
          ? AppColors.failure100
          : AppColors.primaryShade900,
    );
  }

  static Future circularProgress() {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false, // Prevents closing when tapping outside
      builder: (ctx) => const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes shadow
        content: Center(child: CircularProgressIndicator(strokeWidth: 5)),
      ),
    );
  }

  static Widget shimmer({Widget? child, bool enabled = false}) {
    return Skeletonizer(
      enabled: enabled,
      containersColor: AppColors.shimmerContainer,
      effect: const ShimmerEffect.raw(
        colors: [AppColors.shimmerItem, AppColors.shimmerItem1],
      ),
      enableSwitchAnimation: enabled,
      child: child ?? const SizedBox(),
    );
  }
}
