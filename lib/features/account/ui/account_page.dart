import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/currency/ui/currency_picker_bottom_sheet.dart';
import 'package:fin_tamer/features/currency/ui/currency_widget.dart';
import 'package:fin_tamer/features/currency/ui/money_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.accountTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
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
            trailing: const Row(spacing: 16, mainAxisSize: MainAxisSize.min, children: [
              MoneyWidget(amount: 123),
              Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
            ]),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
            tileColor: const Color(0xffD4FAE6),
            title: Text(
              "Валюта",
              style: theme.textTheme.bodyLarge,
            ),
            trailing: const Row(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              children: [
                CurrencyWidget(),
                Icon(Icons.chevron_right, color: Color(0x4d3c3c43)),
              ],
            ),
            onTap: () async {
              await showModalBottomSheet<void>(
                context: context,
                useRootNavigator: true,
                showDragHandle: true,
                useSafeArea: true,
                isScrollControlled: true,
                builder: (context) => const CurrencyPickerBottomSheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}
