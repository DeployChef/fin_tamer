import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fin_tamer/styles/app_colors.dart';

part 'tint_service.g.dart';

const _tintKey = 'appTintColor';
final _defaultTint = AppColors.primaryLight.value; // зелёный по умолчанию

@riverpod
class TintService extends _$TintService {
  @override
  Future<Color> build() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getInt(_tintKey) ?? _defaultTint;
    return Color(value);
  }

  Future<void> setTint(Color color) async {
    state = AsyncValue.data(color);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_tintKey, color.value);
  }
}
