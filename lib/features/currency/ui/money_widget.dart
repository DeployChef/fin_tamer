import 'package:fin_tamer/features/currency/domain/currency_service.dart';
import 'package:fin_tamer/features/currency/domain/models/currency.dart';
import 'package:fin_tamer/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:spoiler_widget/spoiler_widget.dart';

class MoneyWidget extends ConsumerWidget {
  const MoneyWidget({
    super.key,
    required this.amount,
    this.isHide = false,
  });

  final double amount;
  final bool isHide;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = ref.watch(currencyServiceProvider);
    final theme = Theme.of(context);

    if (!isHide) {
      return Text(
        "${NumberFormat("# ##0").format(amount)}${currency.when(
          data: (data) => data.symbol,
          error: (_, __) => Currency.ruble.symbol,
          loading: () => Currency.ruble.symbol,
        )}",
        style: theme.textTheme.bodyLarge,
      );
    } else {
      return RepaintBoundary(
        child: SpoilerText(
          text: "######",
          config: TextSpoilerConfig(
            isEnabled: true,
            particleColor: AppColors.primaryLight,
            textStyle: theme.textTheme.bodyLarge,
          ),
        ),
      );
    }
  }
}
