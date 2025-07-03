import 'package:assesment/config/resources/colors/app_colors.dart';
import 'package:assesment/utils/common_widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppTitleBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppTitleBar({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryShade1000,
      title: AppText(
        text: title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
