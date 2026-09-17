import 'package:get/get_navigation/get_navigation.dart';
import 'package:taqsna/modules/home/binding.dart';
import 'package:taqsna/modules/home/view.dart';
import 'package:taqsna/modules/spalsh/binding.dart';
import 'package:taqsna/modules/spalsh/view.dart';
import 'package:taqsna/routes/app_routes.dart';

abstract final class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
