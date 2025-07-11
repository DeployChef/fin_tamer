import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:fin_tamer/features/settings/ui/widgets/theme_switcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        children: [
          const ThemeSwitcher(),
          const Divider(),
          ListTile(
            title: Text(l10n.primaryColor, style: theme.textTheme.bodyMedium),
            onTap: () {},
            trailing: const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          ),
          const Divider(),
          ListTile(
            title: Text(l10n.sounds, style: theme.textTheme.bodyMedium),
            onTap: () {},
            trailing: const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          ),
          const Divider(),
          ListTile(
            title: Text(l10n.haptics, style: theme.textTheme.bodyMedium),
            onTap: () {},
            trailing: const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          ),
          const Divider(),
          ListTile(
            title: Text(l10n.passcode, style: theme.textTheme.bodyMedium),
            onTap: () {},
            trailing: const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          ),
          const Divider(),
          ListTile(
            title: Text(l10n.sync, style: theme.textTheme.bodyMedium),
            onTap: () {},
            trailing: const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          ),
          const Divider(),
          ListTile(
            title: Text(l10n.language, style: theme.textTheme.bodyMedium),
            onTap: () {},
            trailing: const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          ),
          const Divider(),
          ListTile(
            title: Text(l10n.about, style: theme.textTheme.bodyMedium),
            onTap: () {},
            trailing: const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          ),
        ],
      ),
    );
  }
}
