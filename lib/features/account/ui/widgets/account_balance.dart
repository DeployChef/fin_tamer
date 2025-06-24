import 'dart:async';

import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/account/domain/services/hide_balance.dart';
import 'package:fin_tamer/features/currency/ui/money_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake_gesture/shake_gesture.dart';

class AccountBalance extends ConsumerStatefulWidget {
  const AccountBalance({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends ConsumerState<AccountBalance> {
  StreamSubscription? _accelSubscription;
  bool down = false;

  @override
  void initState() {
    super.initState();
    accelerometerEventStream().listen(_handleAccelerometer);
  }

  @override
  void dispose() {
    _accelSubscription?.cancel();
    super.dispose();
  }

  void _handleAccelerometer(AccelerometerEvent event) {
    if (event.z < -8.5) {
      if (!down) {
        down = !down;
        ref.read(hideBalanceProvider.notifier).toggle();
      }
    } else {
      if (down) {
        down = !down;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShakeGesture(
      onShake: () => ref.read(hideBalanceProvider.notifier).toggle(),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
        tileColor: const Color(0xffD4FAE6),
        leading: const CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Text(
            "💰",
            style: TextStyle(fontSize: 20),
          ),
        ),
        title: Text(
          "Баланс",
          style: theme.textTheme.bodyLarge,
        ),
        trailing: Row(spacing: 16, mainAxisSize: MainAxisSize.min, children: [
          MoneyWidget(
            amount: ref.watch(accountServiceProvider).when(
                  data: (data) => data == null ? 0 : double.parse(data.balance),
                  error: (_, __) => 0,
                  loading: () => 0,
                ),
            isHide: ref.watch(hideBalanceProvider),
          ),
          const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
        ]),
        onTap: () {
          ref.read(hideBalanceProvider.notifier).toggle();
        },
      ),
    );
  }
}
