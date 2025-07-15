import 'package:flutter/material.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/auth/services/pin_code_service.dart';
import 'package:fin_tamer/features/auth/services/biometric_service.dart';
import 'package:fin_tamer/features/auth/ui/pin_code_screen.dart';

class PasscodeSettings extends StatelessWidget {
  const PasscodeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return ListTile(
      title: Text(l10n.passcode, style: theme.textTheme.bodyLarge),
      trailing: const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => const PasscodeSettingsSheet(),
        );
      },
      contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
    );
  }
}

class PasscodeSettingsSheet extends StatefulWidget {
  const PasscodeSettingsSheet({super.key});

  @override
  State<PasscodeSettingsSheet> createState() => _PasscodeSettingsSheetState();
}

class _PasscodeSettingsSheetState extends State<PasscodeSettingsSheet> {
  bool _hasPin = false;
  bool _loading = true;
  bool _biometricEnabled = false;
  bool _biometricAvailable = false;
  final _service = PinCodeService();
  final _biometricService = BiometricService();

  @override
  void initState() {
    super.initState();
    _checkPin();
    _checkBiometric();
  }

  Future<void> _checkPin() async {
    final hasPin = await _service.hasPin();
    setState(() {
      _hasPin = hasPin;
      _loading = false;
    });
    if (hasPin) {
      _checkBiometric();
    }
  }

  Future<void> _checkBiometric() async {
    final available = await _biometricService.isBiometricAvailable();
    final enabled = await _biometricService.isBiometricEnabled();
    setState(() {
      _biometricAvailable = available;
      _biometricEnabled = enabled;
    });
  }

  Future<void> _toggleBiometric(bool value) async {
    if (value) {
      final available = await _biometricService.isBiometricAvailable();
      if (!available) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Биометрия не поддерживается на этом устройстве')),
        );
        return;
      }
    }
    await _biometricService.setBiometricEnabled(value);
    setState(() {
      _biometricEnabled = value;
    });
  }

  void _setPin() async {
    await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => PinCodeScreen(mode: PinCodeMode.set, onSuccess: _checkPin),
      ),
    );
  }

  void _changePin() async {
    await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => PinCodeScreen(mode: PinCodeMode.set, onSuccess: _checkPin),
      ),
    );
  }

  void _deletePin() async {
    await _service.deletePin();
    _checkPin();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    if (_loading) {
      return const Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(_hasPin ? 'Изменить PIN' : 'Установить PIN', style: theme.textTheme.bodyLarge),
              trailing: const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
              onTap: _hasPin ? _changePin : _setPin,
              contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
            ),
            if (_hasPin)
              ListTile(
                title: const Text('Удалить PIN'),
                leading: const Icon(Icons.delete, color: Colors.red),
                onTap: _deletePin,
                contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
              ),
            if (_hasPin && _biometricAvailable)
              SwitchListTile(
                title: const Text('Разблокировка по FaceID/TouchID'),
                value: _biometricEnabled,
                onChanged: _toggleBiometric,
                contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
              ),
          ],
        ),
      ),
    );
  }
}
