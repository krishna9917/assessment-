import 'package:assesment/config/resources/colors/app_colors.dart';
import 'package:assesment/config/resources/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'config/resources/localization/app_translation.dart';
import 'config/routes/route_pages.dart';
import 'local_storage/shared_preference/instance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.updateLocale(const Locale('en', 'US'));
  final storageService = SharedPreferenceInstance();
  await storageService.init();
  Get.put(storageService);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GetMaterialApp(
        title: 'Hipstersg Assessment',
        theme: ThemeData(
          textTheme: AppTextTheme.textTheme(),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryShade1000,
          ),
        ),
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.initialRoute,
        translations: AppTranslation(),
        locale: Get.locale,
        fallbackLocale: const Locale('en', 'US'),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(1)),
            child: child!,
          );
        },
      ),
    );
  }
}
