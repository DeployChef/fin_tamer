import 'package:fin_tamer/features/currency/domain/currency_service.dart';
import 'package:fin_tamer/features/currency/domain/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyWidget extends ConsumerWidget {
  const CurrencyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Text(
      ref.watch(currencyServiceProvider).when(
            data: (data) => data.symbol,
            error: (_, __) => Currency.ruble.symbol,
            loading: () => Currency.ruble.symbol,
          ),
      style: theme.textTheme.bodyLarge,
    );
  }
}
