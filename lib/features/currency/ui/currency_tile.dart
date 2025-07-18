import 'package:fin_tamer/features/currency/domain/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';

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
      onTap: () async {
        final navigator = Navigator.of(context);
        try {
          await ref.read(accountServiceProvider.notifier).updateCurrency(currency: currency);
          navigator.pop();
        } catch (e) {
          if (!context.mounted) return;
          await showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const Text('Ошибка'),
                content: Text(e.toString()),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      navigator.pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
