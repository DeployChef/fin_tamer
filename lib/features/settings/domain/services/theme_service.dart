import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_service.g.dart';

const _themeKey = 'isDarkTheme';

@riverpod
class ThemeService extends _$ThemeService {
  @override
  Future<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }

  Future<void> toggle() async {
    final current = state.value ?? false;
    final newValue = !current;
    state = AsyncValue.data(newValue);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, newValue);
  }
}
