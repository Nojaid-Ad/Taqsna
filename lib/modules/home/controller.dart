import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;

  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();

    pageController = PageController(initialPage: 0);
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void onDestinationSelected(int index) {
    if (index == currentIndex.value) {
      return;
    }

    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
