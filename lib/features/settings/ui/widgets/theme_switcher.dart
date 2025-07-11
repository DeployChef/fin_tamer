import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/settings/domain/services/theme_service.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final asyncTheme = ref.watch(themeServiceProvider);
    final notifier = ref.read(themeServiceProvider.notifier);
    return ListTile(
      title: Text(l10n.darkTheme, style: theme.textTheme.bodyLarge),
      trailing: asyncTheme.when(
        data: (isDark) => Switch(
          value: isDark,
          onChanged: (_) => notifier.toggle(),
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
