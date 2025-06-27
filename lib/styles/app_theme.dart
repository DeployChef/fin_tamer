import 'package:fin_tamer/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      primaryColor: AppColors.primaryLight,
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
      dividerTheme: const DividerThemeData(
        space: 1,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          height: 28 / 22,
          fontWeight: FontWeight.w400,
          color: AppColors.foregroundLight,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          height: 16 / 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: AppColors.foregroundLight,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.foregroundLight,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.foregroundLight,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          height: 36 / 28,
          letterSpacing: 0,
          color: AppColors.foregroundLight,
        ),
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
      dividerTheme: const DividerThemeData(
        space: 1,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          height: 28 / 22,
          fontWeight: FontWeight.w400,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          height: 16 / 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
      ),
    );
  }
}
