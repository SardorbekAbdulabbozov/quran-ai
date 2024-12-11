import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.assets),
    appBarTheme: const AppBarTheme(elevation: 0, backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
  );
}
