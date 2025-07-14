import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:fin_tamer/styles/app_theme.dart';
import 'package:fin_tamer/features/settings/domain/services/tint_service.dart';
import 'package:fin_tamer/features/settings/domain/services/theme_service.dart';

part 'app_theme_service.g.dart';

class AppThemeState {
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final bool isDark;
  AppThemeState({
    required this.lightTheme,
    required this.darkTheme,
    required this.isDark,
  });
}

Color lighten(Color color, [double amount = .2]) {
  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return hslLight.toColor();
}

Color darken(Color color, [double amount = .2]) {
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return hslDark.toColor();
}

@riverpod
class AppThemeService extends _$AppThemeService {
  @override
  Future<AppThemeState> build() async {
    final isDark = await ref.watch(themeServiceProvider.future);
    final tintColor = await ref.watch(tintServiceProvider.future);
    return AppThemeState(
      lightTheme: _createLightTheme(tintColor),
      darkTheme: _createDarkTheme(tintColor),
      isDark: isDark,
    );
  }

  Future<void> updateTheme() async {
    final isDark = await ref.read(themeServiceProvider.future);
    final tintColor = await ref.read(tintServiceProvider.future);
    state = AsyncValue.data(AppThemeState(
      lightTheme: _createLightTheme(tintColor),
      darkTheme: _createDarkTheme(tintColor),
      isDark: isDark,
    ));
  }

  ThemeData _createLightTheme(Color tintColor) {
    final baseTheme = AppTheme.light();
    final secondaryContainer = lighten(tintColor, 0.4);
    final onTint =
        ThemeData.estimateBrightnessForColor(tintColor) == Brightness.dark
            ? Colors.white
            : Colors.black;
    return baseTheme.copyWith(
      primaryColor: tintColor,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: tintColor,
        secondary: tintColor,
        secondaryContainer: secondaryContainer,
      ),
      appBarTheme: baseTheme.appBarTheme.copyWith(
        backgroundColor: tintColor,
        foregroundColor: onTint,
      ),
      navigationBarTheme: baseTheme.navigationBarTheme.copyWith(
        indicatorColor: secondaryContainer,
      ),
      floatingActionButtonTheme: baseTheme.floatingActionButtonTheme.copyWith(
        backgroundColor: tintColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: tintColor,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: tintColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: tintColor,
          side: BorderSide(color: tintColor),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return tintColor.withValues(alpha: 0.2);
            }
            return baseTheme.segmentedButtonTheme.style?.backgroundColor
                    ?.resolve({}) ??
                Colors.transparent;
          }),
          foregroundColor:
              WidgetStateProperty.all<Color>(baseTheme.colorScheme.onSurface),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          overlayColor:
              WidgetStateProperty.all<Color>(tintColor.withValues(alpha: 0.15)),
          elevation: WidgetStateProperty.all<double>(0),
          side: WidgetStateProperty.all<BorderSide>(
              BorderSide(color: tintColor, width: 2)),
          visualDensity: VisualDensity.compact,
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
      ),
    );
  }

  ThemeData _createDarkTheme(Color tintColor) {
    final baseTheme = AppTheme.dark();
    final secondaryContainer = darken(tintColor, 0.2);
    final onTint =
        ThemeData.estimateBrightnessForColor(tintColor) == Brightness.dark
            ? Colors.white
            : Colors.black;
    return baseTheme.copyWith(
      primaryColor: tintColor,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: tintColor,
        secondary: tintColor,
        secondaryContainer: secondaryContainer,
      ),
      appBarTheme: baseTheme.appBarTheme.copyWith(
        backgroundColor: tintColor,
        foregroundColor: onTint,
      ),
      navigationBarTheme: baseTheme.navigationBarTheme.copyWith(
        indicatorColor: secondaryContainer,
      ),
      floatingActionButtonTheme: baseTheme.floatingActionButtonTheme.copyWith(
        backgroundColor: tintColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: tintColor,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: tintColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: tintColor,
          side: BorderSide(color: tintColor),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return tintColor.withValues(alpha: 0.2);
            }
            return baseTheme.segmentedButtonTheme.style?.backgroundColor
                    ?.resolve({}) ??
                Colors.transparent;
          }),
          foregroundColor:
              WidgetStateProperty.all<Color>(baseTheme.colorScheme.onSurface),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          overlayColor:
              WidgetStateProperty.all<Color>(tintColor.withValues(alpha: 0.15)),
          elevation: WidgetStateProperty.all<double>(0),
          side: WidgetStateProperty.all<BorderSide>(
              BorderSide(color: tintColor, width: 2)),
          visualDensity: VisualDensity.compact,
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
      ),
    );
  }
}
