import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hide_balance.g.dart';

@riverpod
class HideBalance extends _$HideBalance {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}
