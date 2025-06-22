import 'package:fin_tamer/features/currency/domain/currency_service.dart';
import 'package:fin_tamer/features/currency/domain/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyTile extends ConsumerWidget {
  const CurrencyTile({super.key, required this.currency});

  final Currency currency;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyIcon = switch (currency) {
      Currency.ruble => const Icon(Icons.currency_ruble, size: 24, color: Colors.black),
      Currency.usDollar => const Icon(Icons.attach_money, size: 24, color: Colors.black),
      Currency.euro => const Icon(Icons.euro, size: 24, color: Colors.black),
    };

    final currencyDescription = switch (currency) {
      Currency.ruble => "Российский рубль ₽",
      Currency.usDollar => "Американский доллар \$",
      Currency.euro => "Евро",
    };

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      leading: currencyIcon,
      title: Text(currencyDescription),
      onTap: () {
        ref.read(currencyServiceProvider.notifier).setCurrency(currency);
        Navigator.of(context).pop();
      },
    );
  }
}
