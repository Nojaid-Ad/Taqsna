import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taqsna/core/localization/app_translations.dart';
import 'package:taqsna/core/theme/app_theme.dart';
import 'package:taqsna/modules/settings/locale_controller.dart';
import 'package:taqsna/modules/settings/theme_controller.dart';
import 'package:taqsna/routes/app_pages.dart';
import 'package:taqsna/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  final storage = GetStorage();

  Get.put<LocaleController>(LocaleController(storage), permanent: true);

  Get.put<ThemeController>(ThemeController(storage), permanent: true);

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(const TaqsnaApp());
}

class TaqsnaApp extends StatelessWidget {
  const TaqsnaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeController = Get.find<LocaleController>();
    final themeController = Get.find<ThemeController>();

    return GetMaterialApp(
      translations: AppTranslations(),
      locale: localeController.locale.value,
      supportedLocales: const [Locale('ar', 'LY'), Locale('en', 'US')],
      fallbackLocale: const Locale('en', 'US'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.light(fontFamily: 'Inter'),
      darkTheme: AppTheme.dark(fontFamily: 'Inter'),
      themeMode: themeController.themeMode.value,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final brightness = Theme.of(context).brightness;

        final overlayStyle = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
          statusBarIconBrightness: brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
          systemNavigationBarContrastEnforced: false,
        );

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: overlayStyle,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
