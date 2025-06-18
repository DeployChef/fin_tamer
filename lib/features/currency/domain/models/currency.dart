enum Currency {
  ruble(symbol: '₽', code: 'RUB'),
  usDollar(symbol: '\$', code: 'DOLLAR'),
  euro(symbol: '€', code: 'EURO');

  final String symbol;
  final String code;
  const Currency({required this.symbol, required this.code});

  static Currency fromCode(String code) => switch (code) {
        'RUB' => euro,
        'DOLLAR' => usDollar,
        'EURO' => euro,
        _ => ruble,
      };
}
