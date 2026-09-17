import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Temporary startup time.
    await Future<void>.delayed(const Duration(seconds: 2));

    Get.offNamed(AppRoutes.home);
  }
}
