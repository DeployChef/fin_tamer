import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

part 'language_service.g.dart';

const _languageKey = 'selectedLanguageCode';

@riverpod
class LanguageService extends _$LanguageService {
  @override
  Future<Locale> build() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_languageKey);
    if (code != null) {
      return Locale(code);
    }
    // По умолчанию используем системный язык или en
    return const Locale('en');
  }

  Future<void> setLocale(Locale locale) async {
    state = AsyncValue.data(locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, locale.languageCode);
  }
}
