import 'package:fin_tamer/features/currency/ui/money_widget.dart';
import 'package:fin_tamer/features/transaction/domain/services/analytics/analytics_service.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/dialogs/category_transaction_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AnalyticItem extends StatelessWidget {
  const AnalyticItem({super.key, required this.item});

  final AnalyticsState item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 14,
      ),
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: theme.colorScheme.secondaryContainer,
        child: Text(
          item.category.emoji,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      title: Text(
        item.category.name,
        style: theme.textTheme.bodyLarge,
      ),
      subtitle: Text(
        item.lastTransactionTitle,
        style: theme.textTheme.bodyMedium,
      ),
      trailing: Row(spacing: 16, mainAxisSize: MainAxisSize.min, children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${item.percentage.toStringAsFixed(0)}%",
              style: theme.textTheme.bodyLarge,
            ),
            MoneyWidget(amount: item.amount),
          ],
        ),
        Icon(Icons.chevron_right, color: theme.dividerColor.withValues(alpha: 0.3)),
      ]),
      onTap: () async {
        await CurrencyPickerBottomSheet.showCurrencyTransactionBottomSheet(context, item.transactions);
      },
    );
  }
}
