import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'haptic_service.g.dart';

const _hapticsKey = 'isHapticsEnabled';

@riverpod
class HapticService extends _$HapticService {
  @override
  Future<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hapticsKey) ?? true;
  }

  Future<void> setEnabled(bool enabled) async {
    state = AsyncValue.data(enabled);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hapticsKey, enabled);
  }

  Future<void> toggle() async {
    final current = state.value ?? true;
    final newValue = !current;
    state = AsyncValue.data(newValue);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hapticsKey, newValue);
  }
}
