import 'package:fin_tamer/core/navigation/routers/app_routes.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/today_transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IncomePage extends ConsumerWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Доходы сегодня"),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(AppRoutes.incomeHistory.name);
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: const TodayTransactionsList.income(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(AppRoutes.incomeDetails.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
