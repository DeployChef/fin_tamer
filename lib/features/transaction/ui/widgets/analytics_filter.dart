import 'package:fin_tamer/core/extensions/date_time_extension.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/transaction/domain/services/analytics/analytics_filter_service.dart';
import 'package:fin_tamer/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyticsFilter extends ConsumerWidget {
  const AnalyticsFilter.income({super.key}) : isIncome = true;
  const AnalyticsFilter.outcome({super.key}) : isIncome = false;

  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = analyticsFilterServiceProvider(isIncome: isIncome);
    final startDate = ref.watch(provider).startDate;
    final endDate = ref.watch(provider).endDate;

    final loc = AppLocalizations.of(context)!;

    final theme = Theme.of(context);

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          title: Text(
            "Период: начало",
            style: theme.textTheme.bodyLarge,
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              startDate.toddMMyyyy(),
              style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
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
          title: Text(
            "Период: конец",
            style: theme.textTheme.bodyLarge,
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              endDate.toddMMyyyy(),
              style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
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
      ],
    );
  }
}
