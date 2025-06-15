import 'package:fin_tamer/core/navigation/routers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OutcomePage extends StatelessWidget {
  const OutcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Расходы сегодня"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(AppRoutes.outcomeDetails.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
