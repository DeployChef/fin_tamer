import 'package:fin_tamer/core/extensions/date_time_extension.dart';
import 'package:fin_tamer/core/navigation/routers/app_routes.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_response.dart';
import 'package:fin_tamer/features/currency/ui/money_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.item, this.showTime = false, this.enableDetails = true});

  final TransactionResponse item;
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
        backgroundColor: const Color(0xFFD4FAE6),
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
            MoneyWidget(amount: double.parse(item.amount)),
            showTime
                ? Text(
                    item.transactionDate.toHHmm(),
                    style: theme.textTheme.bodyLarge,
                  )
                : const SizedBox.shrink(),
          ],
        ),
        enableDetails
            ? const Icon(
                Icons.chevron_right,
                color: Color(0x4d3c3c43),
              )
            : const SizedBox.shrink(),
      ]),
      onTap: enableDetails
          ? () {
              context.goNamed(item.category.isIncome ? AppRoutes.incomeDetails.name : AppRoutes.outcomeDetails.name);
            }
          : null,
    );
  }
}
