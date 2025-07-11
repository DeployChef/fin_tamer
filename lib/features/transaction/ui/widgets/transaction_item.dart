import 'package:fin_tamer/core/extensions/date_time_extension.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/currency/ui/money_widget.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/dialogs/transaction_details.dart';
import 'package:fin_tamer/styles/app_colors.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.item, this.showTime = false, this.enableDetails = true});

  final Transaction item;
  final bool showTime;
  final bool enableDetails;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: item.comment == null ? 11 : 3,
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
      subtitle: item.comment != null
          ? Text(
              item.comment!,
              style: theme.textTheme.bodyMedium,
            )
          : null,
      trailing: Row(spacing: 16, mainAxisSize: MainAxisSize.min, children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MoneyWidget(amount: item.amount),
            showTime
                ? Text(
                    item.transactionDate.toHHmm(),
                    style: theme.textTheme.bodyLarge,
                  )
                : const SizedBox.shrink(),
          ],
        ),
        enableDetails
            ? Icon(
                Icons.chevron_right,
                color: theme.dividerColor.withOpacity(0.3),
              )
            : const SizedBox.shrink(),
      ]),
      onTap: enableDetails
          ? () async {
              await TransactionDetails.showDetailsModal(context, isIncome: item.category.isIncome, transaction: item);
            }
          : null,
    );
  }
}
