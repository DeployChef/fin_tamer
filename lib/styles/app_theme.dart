import 'package:fin_tamer/styles/app_colors.dart';
import 'package:fin_tamer/styles/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      primaryColor: AppColors.primaryLight,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryLight,
        onPrimary: Colors.white,
        secondary: AppColors.alarmLight,
        onSecondary: Colors.white,
        surface: Color(0xffF3EDF7),
        onSurface: AppColors.foregroundLight,
        error: AppColors.alarmLight,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.backgroundLight,
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
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: AppColors.navigationLight,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppFonts.labelMedium.copyWith(color: AppColors.foregroundLight);
          }
          return AppFonts.labelMedium.copyWith(color: AppColors.foregroundLight.withAlpha(100));
        }),
      ),
      dividerTheme: const DividerThemeData(
        space: 1,
        color: Colors.black26,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          side: const BorderSide(color: AppColors.primaryLight),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xff2AE881);
            }
            return const Color(0xffD4FAE6);
          }),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          overlayColor: WidgetStateProperty.all<Color>(const Color(0x332AE881)),
          elevation: WidgetStateProperty.all<double>(0),
          side: WidgetStateProperty.all<BorderSide>(
            const BorderSide(color: Color(0xff2AE881), width: 2),
          ),
          visualDensity: VisualDensity.compact,
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: AppFonts.titleLarge.copyWith(color: AppColors.foregroundLight),
        labelMedium: AppFonts.labelMedium.copyWith(color: AppColors.foregroundLight),
        labelSmall: AppFonts.labelSmall.copyWith(color: AppColors.foregroundLight),
        bodyLarge: AppFonts.bodyLarge.copyWith(color: AppColors.foregroundLight),
        bodyMedium: AppFonts.bodyMedium.copyWith(color: AppColors.foregroundLight),
        headlineMedium: AppFonts.headlineMedium.copyWith(color: AppColors.foregroundLight),
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
        titleLarge: AppFonts.titleLarge,
        labelMedium: AppFonts.labelMedium,
        bodyLarge: AppFonts.bodyLarge,
        bodyMedium: AppFonts.bodyMedium,
        headlineMedium: AppFonts.headlineMedium,
      ),
    );
  }
}
