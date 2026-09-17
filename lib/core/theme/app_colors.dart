import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand
  static const primary = Color(0xFF2563EB);
  static const primaryLight = Color(0xFF60A5FA);
  static const secondary = Color(0xFF38BDF8);

  // Light theme
  static const lightBackground = Color(0xFFF4F8FF);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightCard = Color(0xFFFFFFFF);

  // Dark theme
  static const darkBackground = Color(0xFF08111F);
  static const darkSurface = Color(0xFF101C2E);
  static const darkCard = Color(0xFF142238);

  // Text
  static const lightText = Color(0xFF0F172A);
  static const lightSecondaryText = Color(0xFF64748B);

  static const darkText = Color(0xFFF8FAFC);
  static const darkSecondaryText = Color(0xFFCBD5E1);

  // Feedback
  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const info = Color(0xFF3B82F6);

  // Glass
  static const glassLight = Color(0x66FFFFFF);
  static const glassDark = Color(0x33142038);

  static const lightBorder = Color(0xFFE2E8F0);
  static const darkBorder = Color(0xFF26364D);
}
