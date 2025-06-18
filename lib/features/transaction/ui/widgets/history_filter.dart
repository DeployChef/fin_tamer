import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryFilter extends ConsumerWidget {
  const HistoryFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          tileColor: const Color(0xffD4FAE6),
          title: Text("Начало"),
          trailing: Text("Начало"),
        ),
        const Divider(height: 1),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          tileColor: const Color(0xffD4FAE6),
          title: Text("Конец"),
          trailing: Text("Конец"),
        ),
        const Divider(height: 1),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          tileColor: const Color(0xffD4FAE6),
          title: Text("Сортировка"),
          trailing: Text("Сортировка"),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
