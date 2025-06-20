import 'package:fin_tamer/core/extensions/date_time_extension.dart';
import 'package:fin_tamer/features/transaction/domain/models/sort_type.dart';
import 'package:fin_tamer/features/transaction/domain/services/history_filter_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryFilter extends ConsumerWidget {
  const HistoryFilter.income({super.key}) : isIncome = true;
  const HistoryFilter.outcome({super.key}) : isIncome = false;

  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = historyFilterServiceProvider(isIncome: isIncome);
    final startDate = ref.watch(provider).startDate;
    final endDate = ref.watch(provider).endDate;
    final sortType = ref.watch(provider).sortType;

    final sortDescription = switch (sortType) {
      SortType.amount => "По сумме",
      SortType.date => "По дате",
    };

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          tileColor: const Color(0xffD4FAE6),
          title: Text("Начало"),
          trailing: Text(startDate.toddMMyyyy()),
          onTap: () async {
            final dateTime = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
              initialDate: startDate,
            );

            ref.read(provider.notifier).setStart(startDate: dateTime!);
          },
        ),
        const Divider(height: 1),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          tileColor: const Color(0xffD4FAE6),
          title: Text("Конец"),
          trailing: Text(endDate.toddMMyyyy()),
          onTap: () async {
            final dateTime = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
              initialDate: DateTime(endDate.year, endDate.month, endDate.day),
            );

            ref.read(provider.notifier).setEnd(endDate: dateTime!);
          },
        ),
        const Divider(height: 1),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          tileColor: const Color(0xffD4FAE6),
          title: Text("Сортировка"),
          trailing: Text(sortDescription),
          onTap: () async {
            final newSort = switch (sortType) {
              SortType.amount => SortType.date,
              SortType.date => SortType.amount,
            };

            ref.read(provider.notifier).setSortType(sortType: newSort);
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}
