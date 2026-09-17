import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taqsna/core/theme/app_colors.dart';
import 'package:taqsna/routes/app_routes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 64,
      titleSpacing: 12,

      title: Row(
        children: [
          SizedBox(
            width: 38,
            height: 38,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -1,
                  right: -2,
                  child: SvgPicture.asset(
                    'assets/images/sun_logo.svg',
                    width: 18,
                    height: 18,
                  ),
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 29,
                    height: 29,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(
            'app_name'.tr,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        ],
      ),

      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 12),
          child: _SettingsButton(
            isDark: isDark,
            onTap: () => Get.toNamed(AppRoutes.settings),
          ),
        ),
      ],
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({required this.isDark, required this.onTap});

  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                // Soft glass surface
                color: isDark
                    ? AppColors.darkSurface.withValues(alpha: 0.62)
                    : AppColors.lightSurface.withValues(alpha: 0.62),

                // Subtle glossy highlight
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                      ? [
                          Colors.white.withValues(alpha: 0.05),
                          Colors.transparent,
                        ]
                      : [
                          Colors.white.withValues(alpha: 0.30),
                          Colors.white.withValues(alpha: 0.05),
                        ],
                ),

                border: Border.all(
                  color: isDark
                      ? AppColors.darkBorder.withValues(alpha: 0.75)
                      : AppColors.lightBorder.withValues(alpha: 0.90),
                  width: 1,
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.18 : 0.07),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.settings_outlined,
                size: 21,
                color: isDark ? AppColors.darkText : AppColors.lightText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
