import 'package:fin_tamer/features/currency/ui/currency_picker_bottom_sheet.dart';
import 'package:fin_tamer/features/currency/ui/currency_widget.dart';
import 'package:flutter/material.dart';

class AccountCurrency extends StatelessWidget {
  const AccountCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      tileColor: theme.colorScheme.secondaryContainer,
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
    );
  }
}
