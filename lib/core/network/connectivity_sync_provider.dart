import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'connectivity_sync_provider.g.dart';

enum NetworkStatus { online, offline }

@riverpod
class ConnectivitySync extends _$ConnectivitySync {
  late final StreamSubscription _subscription;
  late final InternetConnectionChecker _checker;

  @override
  NetworkStatus build() {
    _checker = InternetConnectionChecker.createInstance();

    _checker.hasConnection.then((hasConnection) {
      state = hasConnection ? NetworkStatus.online : NetworkStatus.offline;
    });

    _subscription = _checker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        state = NetworkStatus.online;
      } else {
        state = NetworkStatus.offline;
      }
    });

    ref.onDispose(() {
      _subscription.cancel();
    });

    return NetworkStatus.offline;
  }
}
