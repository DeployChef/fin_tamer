import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Income"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed("INCOME_DETAILS");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
