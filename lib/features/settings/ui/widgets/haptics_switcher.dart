import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/settings/domain/services/haptic_service.dart';

class HapticsSwitcher extends ConsumerWidget {
  const HapticsSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final asyncHaptics = ref.watch(hapticServiceProvider);
    final notifier = ref.read(hapticServiceProvider.notifier);
    return ListTile(
      title: Text(l10n.haptics, style: theme.textTheme.bodyLarge),
      trailing: asyncHaptics.when(
        data: (enabled) => Switch(
          value: enabled,
          onChanged: (_) async {
            await notifier.toggle();
          },
        ),
        loading: () => const SizedBox(
          width: 48,
          height: 24,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
        error: (e, _) => const Icon(Icons.error, color: Colors.red),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
    );
  }
}
