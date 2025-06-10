import 'package:fin_tamer/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryLight,
        elevation: 0,
        shape: CircleBorder(),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryLight,
        centerTitle: true,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: AppColors.navigationLight,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryLight,
        elevation: 0,
        shape: CircleBorder(),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryLight,
        centerTitle: true,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: AppColors.navigationLight,
      ),
    );
  }
}
