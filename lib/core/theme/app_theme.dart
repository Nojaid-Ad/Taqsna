import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

abstract final class AppTheme {
  static ThemeData light({required String fontFamily}) {
    return buildLightTheme(fontFamily: fontFamily);
  }

  static ThemeData dark({required String fontFamily}) {
    return buildDarkTheme(fontFamily: fontFamily);
  }
}
