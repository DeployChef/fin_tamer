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
          context.goNamed("OUTCOME_DETAILS");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
