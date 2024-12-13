import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/config/routes/app_router.dart';
import 'package:doctor_flutter_v1/config/theme.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/model/otp_model.dart';
import 'package:doctor_flutter_v1/presentation/auth/otp/view/otp_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.locale == const Locale("ar")) {
      CacheService.setData(key: AppCacheKey.lang, value: context.locale);
    }

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          initialRoute: AppPage.splashScreen,
          navigatorKey: AppRouter.navigatorKey,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
