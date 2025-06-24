import 'package:fin_tamer/features/transaction/domain/models/transaction_response.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class CurrencyPickerBottomSheet extends StatelessWidget {
  const CurrencyPickerBottomSheet({
    super.key,
    required this.transactions,
  });

  final List<TransactionResponse> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final item = transactions[index];
        return Column(
          children: [
            TransactionItem(
              item: item,
              enableDetails: false,
            ),
            const Divider(),
          ],
        );
      },
    );
  }

  static Future<void> showCurrencyTransactionBottomSheet(BuildContext context, List<TransactionResponse> transactions) async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => CurrencyPickerBottomSheet(transactions: transactions),
    );
  }
}
