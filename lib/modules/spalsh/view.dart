import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomIn(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutBack,
                child: SizedBox(
                  width: 220,
                  height: 220,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Spin(
                          infinite: true,
                          duration: const Duration(seconds: 3),
                          spins: 1,
                          curve: Curves.linear,
                          child: SvgPicture.asset(
                            'assets/images/sun_logo.svg',
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/images/logo.svg',
                          width: 180,
                          height: 180,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'app_name'.tr,
                  style: textTheme.displayLarge?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: FadeIn(
            child: Text(
              '${'developed_by'.tr}\n${'copyright'.tr}',
              textAlign: TextAlign.center,
              style: textTheme.labelSmall,
            ),
          ),
        ),
      ),
    );
  }
}
