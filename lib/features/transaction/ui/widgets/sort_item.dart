import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/transaction/domain/models/sort_type.dart';
import 'package:fin_tamer/features/transaction/domain/services/history/history_filter_service.dart';
import 'package:fin_tamer/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortItem extends ConsumerWidget {
  const SortItem({
    required this.sortType,
    required this.isIncome,
    super.key,
  });

  final SortType sortType;
  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = historyFilterServiceProvider(isIncome: isIncome);
    final providerFilterOption = ref.watch(historyFilterServiceProvider(isIncome: isIncome));

    final loc = AppLocalizations.of(context)!;

    final sortDescription = switch (sortType) {
      SortType.amount => loc.byAmount,
      SortType.date => loc.byDate,
    };

    return InkWell(
      onTap: () {
        ref.read(provider.notifier).setSortType(sortType: sortType);
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sortDescription,
              style: const TextStyle(fontSize: 16),
            ),
            providerFilterOption.sortType == sortType ? const Icon(Icons.check_circle, color: AppColors.primaryLight) : const Icon(Icons.circle_outlined),
          ],
        ),
      ),
    );
  }
}
