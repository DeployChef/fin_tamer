import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';

class UpdateAccountDialog extends ConsumerWidget {
  UpdateAccountDialog({super.key, required this.account});

  final Account account;
  final TextEditingController nameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context)!;

    Future<void> showErrorDialog(String message) async {
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(loc.errorTitle),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text(loc.okButton),
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
          labelText: loc.updateAccountLabel,
          labelStyle: theme.textTheme.labelMedium,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(loc.cancel),
        ),
        ElevatedButton(
          onPressed: () async {
            final newName = nameEditingController.text.trim();
            if (newName.isNotEmpty) {
              try {
                final navigator = Navigator.of(context);
                await ref
                    .read(accountServiceProvider.notifier)
                    .updateAccount(name: newName);
                navigator.pop();
              } catch (e) {
                await showErrorDialog(e.toString());
              }
            }
          },
          child: Text(loc.save),
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
