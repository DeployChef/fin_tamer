import 'package:fin_tamer/core/navigation/routers/app_routes.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_response.dart';
import 'package:fin_tamer/features/currency/ui/money_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.item, this.showTime = true});

  final TransactionResponse item;
  final bool showTime;

  @override
  Widget build(BuildContext context) {
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
      title: Text(item.category.name),
      subtitle: item.comment != null ? Text(item.comment!) : null,
      trailing: Row(spacing: 16, mainAxisSize: MainAxisSize.min, children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MoneyWidget(amount: double.parse(item.amount)),
            showTime ? Text(DateFormat('HH:mm').format(item.transactionDate)) : const SizedBox.shrink(),
          ],
        ),
        const Icon(Icons.chevron_right, color: Color(0xff3c3c434d)),
      ]),
      onTap: () {
        context.goNamed(AppRoutes.incomeDetails.name);
      },
    );
  }
}
