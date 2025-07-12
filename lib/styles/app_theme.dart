import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      primaryColor: AppColors.primaryLight,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryLight,
        onPrimary: Colors.white,
        secondary: AppColors.primaryLight,
        onSecondary: Colors.white,
        surface: AppColors.backgroundLight,
        onSurface: AppColors.foregroundLight,
        error: AppColors.alarmLight,
        onError: Colors.white,
        secondaryContainer: AppColors.accentLight,
        surfaceVariant: AppColors.surfaceVariantLight,
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
        foregroundColor: AppColors.foregroundLight,
        centerTitle: true,
        elevation: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: AppColors.navigationLight,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppFonts.labelMedium.copyWith(color: Colors.black);
          }
          return AppFonts.labelMedium
              .copyWith(color: Colors.black.withOpacity(0.6));
        }),
        backgroundColor: AppColors.bottomBarLight,
      ),
      dividerTheme: const DividerThemeData(
        space: 1,
        color: AppColors.dividerLight,
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
              return AppColors.primaryLight.withOpacity(0.2);
            }
            return AppColors.navigationLight;
          }),
          foregroundColor:
              WidgetStateProperty.all<Color>(AppColors.foregroundLight),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          overlayColor: WidgetStateProperty.all<Color>(
              AppColors.primaryLight.withOpacity(0.15)),
          elevation: WidgetStateProperty.all<double>(0),
          side: WidgetStateProperty.all<BorderSide>(
            const BorderSide(color: AppColors.primaryLight, width: 2),
          ),
          visualDensity: VisualDensity.compact,
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
      ),
      textTheme: TextTheme(
        titleLarge:
            AppFonts.titleLarge.copyWith(color: AppColors.foregroundLight),
        labelMedium:
            AppFonts.labelMedium.copyWith(color: AppColors.foregroundLight),
        labelSmall:
            AppFonts.labelSmall.copyWith(color: AppColors.secondaryTextLight),
        bodyLarge:
            AppFonts.bodyLarge.copyWith(color: AppColors.foregroundLight),
        bodyMedium:
            AppFonts.bodyMedium.copyWith(color: AppColors.secondaryTextLight),
        headlineMedium:
            AppFonts.headlineMedium.copyWith(color: AppColors.foregroundLight),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.primaryDark,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryDark,
        onPrimary: Colors.white,
        secondary: AppColors.primaryDark,
        onSecondary: Colors.white,
        surface: AppColors.backgroundDark,
        onSurface: AppColors.foregroundDark,
        error: AppColors.alarmDark,
        onError: Colors.white,
        secondaryContainer: AppColors.primaryDark,
        surfaceVariant: AppColors.surfaceVariantDark,
      ),
      scaffoldBackgroundColor: AppColors.backgroundDark,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        shape: CircleBorder(),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.foregroundDark,
        centerTitle: true,
        elevation: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: AppColors.navigationDark,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppFonts.labelMedium.copyWith(color: Colors.white);
          }
          return AppFonts.labelMedium
              .copyWith(color: Colors.white.withOpacity(0.7));
        }),
        backgroundColor: AppColors.bottomBarDark,
      ),
      dividerTheme: const DividerThemeData(
        space: 1,
        color: AppColors.dividerDark,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryDark,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryDark,
          side: const BorderSide(color: AppColors.primaryDark),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryDark.withOpacity(0.2);
            }
            return AppColors.navigationDark;
          }),
          foregroundColor:
              WidgetStateProperty.all<Color>(AppColors.foregroundDark),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          overlayColor: WidgetStateProperty.all<Color>(
              AppColors.primaryDark.withOpacity(0.15)),
          elevation: WidgetStateProperty.all<double>(0),
          side: WidgetStateProperty.all<BorderSide>(
            const BorderSide(color: AppColors.primaryDark, width: 2),
          ),
          visualDensity: VisualDensity.compact,
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
      ),
      textTheme: TextTheme(
        titleLarge:
            AppFonts.titleLarge.copyWith(color: AppColors.foregroundDark),
        labelMedium:
            AppFonts.labelMedium.copyWith(color: AppColors.foregroundDark),
        labelSmall:
            AppFonts.labelSmall.copyWith(color: AppColors.secondaryTextDark),
        bodyLarge: AppFonts.bodyLarge.copyWith(color: AppColors.foregroundDark),
        bodyMedium:
            AppFonts.bodyMedium.copyWith(color: AppColors.secondaryTextDark),
        headlineMedium:
            AppFonts.headlineMedium.copyWith(color: AppColors.foregroundDark),
      ),
    );
  }
}
