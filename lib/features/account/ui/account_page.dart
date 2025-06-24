import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/account/ui/widgets/account_balance.dart';
import 'package:fin_tamer/features/account/ui/widgets/account_currency.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        children: [
          AccountBalance(),
          Divider(),
          AccountCurrency(),
        ],
      ),
    );
  }
}
