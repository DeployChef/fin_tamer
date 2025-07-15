import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_tamer/features/settings/domain/services/language_service.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';

class LanguagePicker extends ConsumerWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeAsync = ref.watch(languageServiceProvider);
    final l10n = AppLocalizations.of(context);
    return localeAsync.when(
      data: (locale) {
        return ListTile(
          title: Text(l10n?.language ?? 'Language', style: Theme.of(context).textTheme.bodyLarge),
          trailing: const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          onTap: () => _showLanguageBottomSheet(context, ref, locale),
        );
      },
      loading: () => const ListTile(
        title: Text('...'),
        trailing: Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      ),
      error: (e, s) => ListTile(
        title: const Text('Error'),
        trailing: const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
        contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
        subtitle: Text(e.toString()),
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context, WidgetRef ref, Locale currentLocale) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _LanguageBottomSheet(ref: ref, currentLocale: currentLocale),
    );
  }
}

class _LanguageBottomSheet extends StatelessWidget {
  final WidgetRef ref;
  final Locale currentLocale;
  const _LanguageBottomSheet({required this.ref, required this.currentLocale});

  @override
  Widget build(BuildContext context) {
    final languages = [
      {'code': 'en', 'name': 'English'},
      {'code': 'ru', 'name': 'Русский'},
    ];
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: languages.map((lang) {
          final isSelected = currentLocale.languageCode == lang['code'];
          return ListTile(
            title: Text(lang['name']!),
            trailing: isSelected ? const Icon(Icons.check, color: Colors.blue) : null,
            onTap: () async {
              final nav = Navigator.of(context);
              await ref.read(languageServiceProvider.notifier).setLocale(Locale(lang['code']!));
              nav.pop();
            },
          );
        }).toList(),
      ),
    );
  }
}
