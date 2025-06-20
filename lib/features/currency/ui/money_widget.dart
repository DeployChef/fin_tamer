import 'package:fin_tamer/features/currency/domain/currency_service.dart';
import 'package:fin_tamer/features/currency/domain/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MoneyWidget extends ConsumerWidget {
  const MoneyWidget({
    super.key,
    required this.amount,
  });

  final double amount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = ref.watch(currencyServiceProvider);
    final theme = Theme.of(context);

    return Text(
      "${NumberFormat("# ##0").format(amount)}${currency.when(
        data: (data) => data.symbol,
        error: (_, __) => Currency.ruble.symbol,
        loading: () => Currency.ruble.symbol,
      )}",
      style: theme.textTheme.bodyLarge,
    );
  }
}
