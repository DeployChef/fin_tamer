import 'package:fin_tamer/features/currency/domain/models/currency.dart';
import 'package:flutter/material.dart';

class CurrencyWidget extends StatelessWidget {
  final Currency currency;

  const CurrencyWidget({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Text(currency.symbol);
  }
}
