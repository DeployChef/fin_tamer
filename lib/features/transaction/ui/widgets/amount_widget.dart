import 'package:fin_tamer/features/currency/ui/money_widget.dart';
import 'package:flutter/material.dart';

class AmountWidget extends StatelessWidget {
  const AmountWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  final String title;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      tileColor: const Color(0xffD4FAE6),
      title: Text(title),
      trailing: MoneyWidget(amount: amount),
    );
  }
}
