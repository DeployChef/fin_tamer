import 'package:fin_tamer/features/currency/domain/models/currency.dart';
import 'package:fin_tamer/features/currency/ui/currency_tile.dart';
import 'package:fin_tamer/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyPickerBottomSheet extends ConsumerWidget {
  const CurrencyPickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CurrencyTile(currency: Currency.ruble),
        const Divider(),
        const CurrencyTile(currency: Currency.usDollar),
        const Divider(),
        const CurrencyTile(currency: Currency.euro),
        const Divider(),
        ListTile(
          tileColor: AppColors.alarmLight,
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          leading: const Icon(
            Icons.cancel_outlined,
            color: Colors.white,
            size: 20,
          ),
          title: Text(
            "Отмена",
            style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
