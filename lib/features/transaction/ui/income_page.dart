import 'package:fin_tamer/core/navigation/routers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Доходы сегодня"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(AppRoutes.incomeDetails.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
