import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/settings/domain/services/tint_service.dart';
import 'package:fin_tamer/features/settings/domain/services/app_theme_service.dart';

class TintPicker extends ConsumerWidget {
  const TintPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final tintAsync = ref.watch(tintServiceProvider);

    return tintAsync.when(
      data: (tintColor) => ListTile(
        title: Text(l10n.primaryColor, style: theme.textTheme.bodyLarge),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: tintColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.outline.withOpacity(0.3),
                  width: 1,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
        onTap: () => _showColorPicker(context, ref, tintColor),
      ),
      loading: () => const ListTile(
        title: Text('Loading...'),
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      ),
      error: (error, stack) => ListTile(
        title: Text('Error: $error', style: theme.textTheme.bodyLarge),
        contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      ),
    );
  }

  void _showColorPicker(
      BuildContext context, WidgetRef ref, Color currentColor) {
    Color pickerColor = currentColor;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Выберите цвет'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: (Color color) {
                pickerColor = color;
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Выбрать'),
              onPressed: () async {
                await ref
                    .read(tintServiceProvider.notifier)
                    .setTint(pickerColor);
                await ref.read(appThemeServiceProvider.notifier).updateTheme();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
