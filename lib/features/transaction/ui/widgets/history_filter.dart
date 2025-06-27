import 'package:fin_tamer/core/extensions/date_time_extension.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/transaction/domain/models/sort_type.dart';
import 'package:fin_tamer/features/transaction/domain/services/history/history_filter_service.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/sort_item.dart';
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

    final loc = AppLocalizations.of(context)!;

    final sortDescription = switch (sortType) {
      SortType.amount => loc.byAmount,
      SortType.date => loc.byDate,
    };

    final theme = Theme.of(context);

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          tileColor: const Color(0xffD4FAE6),
          title: Text(
            loc.filterStartDate,
            style: theme.textTheme.bodyLarge,
          ),
          trailing: Text(
            startDate.toddMMyyyy(),
            style: theme.textTheme.bodyLarge,
          ),
          onTap: () async {
            final dateTime = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
              initialDate: startDate,
            );

            if (dateTime == null) return;

            ref.read(provider.notifier).setStart(startDate: dateTime);
          },
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          tileColor: const Color(0xffD4FAE6),
          title: Text(
            loc.filterEndDate,
            style: theme.textTheme.bodyLarge,
          ),
          trailing: Text(
            endDate.toddMMyyyy(),
            style: theme.textTheme.bodyLarge,
          ),
          onTap: () async {
            final dateTime = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
              initialDate: DateTime(endDate.year, endDate.month, endDate.day),
            );

            if (dateTime == null) return;

            ref.read(provider.notifier).setEnd(endDate: dateTime);
          },
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          tileColor: const Color(0xffD4FAE6),
          title: Text(
            loc.filterSort,
            style: theme.textTheme.bodyLarge,
          ),
          trailing: Text(
            sortDescription,
            style: theme.textTheme.bodyLarge,
          ),
          onTap: () async {
            await showOrderBottomSheet(context);
          },
        ),
        const Divider(),
      ],
    );
  }

  Future<void> showOrderBottomSheet(BuildContext context) async {
    final loc = AppLocalizations.of(context)!;

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            loc.filterSort,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SortItem(
            sortType: SortType.date,
            isIncome: isIncome,
          ),
          SortItem(
            sortType: SortType.amount,
            isIncome: isIncome,
          ),
        ],
      ),
    );
  }
}
