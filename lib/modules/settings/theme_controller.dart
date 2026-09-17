import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/constants/storage_keys.dart';

class ThemeController extends GetxController {
  ThemeController(this.storage);

  final GetStorage storage;

  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();

    _loadTheme();
  }

  void _loadTheme() {
    final savedTheme = storage.read<String>(StorageKeys.themeMode);

    switch (savedTheme) {
      case 'light':
        themeMode.value = ThemeMode.light;
        break;

      case 'dark':
        themeMode.value = ThemeMode.dark;
        break;

      default:
        themeMode.value = ThemeMode.system;
    }
  }

  void changeTheme(ThemeMode mode) {
    themeMode.value = mode;

    storage.write(StorageKeys.themeMode, mode.name);

    Get.changeThemeMode(mode);
  }
}
