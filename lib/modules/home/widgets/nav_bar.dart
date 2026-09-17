import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taqsna/core/theme/app_colors.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            height: 68,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

              // Soft glass surface.
              color: isDark
                  ? AppColors.darkSurface.withValues(alpha: 0.88)
                  : AppColors.lightBackground.withValues(alpha: 0.88),

              border: Border.all(
                color: isDark
                    ? AppColors.darkBorder.withValues(alpha: 0.85)
                    : AppColors.lightBorder.withValues(alpha: 0.95),
                width: 1,
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.20 : 0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: _NavItem(
                    icon: Icons.home_outlined,
                    selectedIcon: Icons.home_rounded,
                    label: 'home'.tr,
                    selected: currentIndex == 0,
                    onTap: () => onDestinationSelected(0),
                    isDark: isDark,
                  ),
                ),
                Expanded(
                  child: _NavItem(
                    icon: Icons.map_outlined,
                    selectedIcon: Icons.map_rounded,
                    label: 'map'.tr,
                    selected: currentIndex == 1,
                    onTap: () => onDestinationSelected(1),
                    isDark: isDark,
                  ),
                ),
                Expanded(
                  child: _NavItem(
                    icon: Icons.favorite_border_rounded,
                    selectedIcon: Icons.favorite_rounded,
                    label: 'favorites'.tr,
                    selected: currentIndex == 2,
                    onTap: () => onDestinationSelected(2),
                    isDark: isDark,
                  ),
                ),
                Expanded(
                  child: _NavItem(
                    icon: Icons.bar_chart_outlined,
                    selectedIcon: Icons.bar_chart_rounded,
                    label: 'statistics'.tr,
                    selected: currentIndex == 3,
                    onTap: () => onDestinationSelected(3),
                    isDark: isDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.isDark,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final inactiveColor = isDark
        ? AppColors.darkSecondaryText
        : AppColors.lightSecondaryText;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primary.withValues(alpha: 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selected ? selectedIcon : icon,
                size: 22,
                color: selected ? AppColors.primary : inactiveColor,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: selected ? AppColors.primary : inactiveColor,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
