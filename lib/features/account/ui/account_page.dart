import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/account/ui/widgets/account_balance.dart';
import 'package:fin_tamer/features/account/ui/widgets/account_currency.dart';
import 'package:fin_tamer/features/account/ui/widgets/update_account_dialog.dart';
import 'package:fin_tamer/features/history/ui/history_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.accountTitle),
        actions: [
          IconButton(
            onPressed: ref.watch(accountServiceProvider).when(
                  data: (data) => data != null
                      ? () async {
                          await UpdateAccountDialog.show(context, data);
                        }
                      : null,
                  error: (error, stackTrace) => null,
                  loading: () => null,
                ),
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: const Column(
        children: [
          AccountBalance(),
          Divider(),
          AccountCurrency(),
          HistoryChart(),
        ],
      ),
    );
  }
}
