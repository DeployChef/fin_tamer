import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateAccountDialog extends ConsumerWidget {
  UpdateAccountDialog({super.key, required this.account});

  final Account account;
  final TextEditingController nameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    Future<void> _showErrorDialog(String message) async {
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ошибка'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return AlertDialog(
      title: Text(
        account.name,
        style: theme.textTheme.bodyLarge,
      ),
      content: TextField(
        controller: nameEditingController,
        decoration: InputDecoration(
          labelText: 'Введите новое название счета',
          labelStyle: theme.textTheme.labelMedium,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: () async {
            final newName = nameEditingController.text.trim();
            if (newName.isNotEmpty) {
              try {
                await ref
                    .read(accountServiceProvider.notifier)
                    .updateAccount(name: newName);
                Navigator.of(context).pop();
              } catch (e) {
                await _showErrorDialog(e.toString());
              }
            }
          },
          child: const Text('Сохранить'),
        ),
      ],
    );
  }

  static Future<void> show(BuildContext context, Account account) async {
    await showDialog<void>(
        context: context,
        builder: (context) {
          return UpdateAccountDialog(
            account: account,
          );
        });
  }
}
