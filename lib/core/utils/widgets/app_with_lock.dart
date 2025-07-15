import 'package:flutter/material.dart';
import 'package:fin_tamer/features/auth/services/pin_code_service.dart';
import 'package:fin_tamer/features/auth/services/biometric_service.dart';
import 'package:fin_tamer/features/auth/ui/pin_code_screen.dart';

// Экспорт для удобства импорта
export 'app_with_lock.dart' show AppWithLock;

class AppWithLock extends StatefulWidget {
  final Widget child;
  const AppWithLock({super.key, required this.child});

  @override
  State<AppWithLock> createState() => _AppWithLockState();
}

class _AppWithLockState extends State<AppWithLock> with WidgetsBindingObserver {
  bool _locked = false;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkLock();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkLock();
    }
  }

  Future<void> _checkLock() async {
    setState(() {
      _checking = true;
    });
    final pinService = PinCodeService();
    final bioService = BiometricService();
    final hasPin = await pinService.hasPin();
    final bioEnabled = await bioService.isBiometricEnabled();
    if (hasPin) {
      if (bioEnabled) {
        final bioOk = await bioService.authenticate();
        if (bioOk) {
          setState(() {
            _locked = false;
            _checking = false;
          });
          return;
        }
      }
      setState(() {
        _locked = true;
        _checking = false;
      });
    } else {
      setState(() {
        _locked = false;
        _checking = false;
      });
    }
  }

  void _onPinSuccess() {
    setState(() {
      _locked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_checking) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Stack(
      children: [
        widget.child,
        if (_locked)
          Material(
            color: Colors.white,
            child: PinCodeScreen(mode: PinCodeMode.enter, onSuccess: _onPinSuccess),
          ),
      ],
    );
  }
}
