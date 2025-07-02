import 'package:assesment/utils/common_widgets/app_scaffold.dart';
import 'package:assesment/utils/common_widgets/app_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: Center(child: AppText(text: "Splash Screen"),));
  }
}
