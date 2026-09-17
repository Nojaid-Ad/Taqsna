import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taqsna/modules/home/widgets/app_bar.dart';
import 'package:taqsna/modules/home/widgets/nav_bar.dart';

import 'controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: PageView.builder(
        controller: controller.pageController,
        itemCount: 4,
        onPageChanged: controller.onPageChanged,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return const Center(child: Text('Home'));

            case 1:
              return const Center(child: Text('Map'));

            case 2:
              return const Center(child: Text('Favorites'));

            case 3:
              return const Center(child: Text('Statistics'));

            default:
              return const SizedBox.shrink();
          }
        },
      ),

      bottomNavigationBar: Obx(
        () => HomeNavBar(
          currentIndex: controller.currentIndex.value,
          onDestinationSelected: controller.onDestinationSelected,
        ),
      ),
    );
  }
}
