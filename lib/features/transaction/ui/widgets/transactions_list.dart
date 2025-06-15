import 'package:fin_tamer/features/account/repository/mock_account_repository.dart';
import 'package:fin_tamer/features/category/repository/mock_category_repository.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_response.dart';
import 'package:fin_tamer/features/transaction/repository/mock_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({super.key});

  final MockTransactionRepository repo = MockTransactionRepository(MockAccountRepository(), MockCategoryRepository());

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now().toUtc();
    var from = DateTime(now.year, now.month, now.day);
    var to = from.add(const Duration(days: 1)).add(const Duration(minutes: -1));

    return FutureBuilder(
      future: repo.getByPeriod(1, from, to),
      builder: (BuildContext context, AsyncSnapshot<List<TransactionResponse>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final transactions = snapshot.data!.where((c) => !c.category.isIncome).toList();
          final amount = transactions.map((c) => double.parse(c.amount)).reduce((a, b) => a + b);
          return Column(
            children: [
              Container(
                height: 56,
                color: Color(0xffD4FAE6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Всего"),
                      Text("${NumberFormat("# ##0").format(amount)} ₽"),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final item = transactions[index];
                    return Column(
                      children: [
                        TransactionItem(item: item),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
