import 'package:fin_tamer/core/navigation/routers/app_routes.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_response.dart';
import 'package:fin_tamer/features/currency/ui/money_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.item});

  final TransactionResponse item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: 3),
      leading: SizedBox(
          height: 24,
          width: 24,
          child: CircleAvatar(
            backgroundColor: const Color(0xFFD4FAE6),
            child: Text(
              item.category.emoji,
              style: const TextStyle(fontSize: 18),
            ),
          )),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(item.category.name), MoneyWidget(amount: double.parse(item.amount))],
      ),
      trailing: const Icon(Icons.chevron_right, color: Color(0xff3c3c434d)),
      onTap: () {
        context.goNamed(AppRoutes.incomeDetails.name);
      },
    );
  }
}
