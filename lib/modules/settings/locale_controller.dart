import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/constants/storage_keys.dart';

class LocaleController extends GetxController {
  LocaleController(this.storage);

  final GetStorage storage;

  final Rx<Locale> locale = const Locale('en', 'US').obs;

  bool get isArabic => locale.value.languageCode == 'ar';

  @override
  void onInit() {
    super.onInit();

    _loadLanguage();
  }

  void _loadLanguage() {
    final savedLanguage = storage.read<String>(StorageKeys.language);

    if (savedLanguage == 'ar') {
      locale.value = const Locale('ar', 'LY');
      return;
    }

    if (savedLanguage == 'en') {
      locale.value = const Locale('en', 'US');
      return;
    }

    locale.value = _getSystemLocale();
  }

  Locale _getSystemLocale() {
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;

    switch (systemLocale.languageCode) {
      case 'ar':
        return const Locale('ar', 'LY');

      case 'en':
        return const Locale('en', 'US');

      default:
        // Taqsna currently supports Arabic and English only.
        return const Locale('en', 'US');
    }
  }

  void changeLanguage(String languageCode) {
    final newLocale = languageCode == 'ar'
        ? const Locale('ar', 'LY')
        : const Locale('en', 'US');

    locale.value = newLocale;

    storage.write(StorageKeys.language, languageCode);

    Get.updateLocale(newLocale);
  }
}
