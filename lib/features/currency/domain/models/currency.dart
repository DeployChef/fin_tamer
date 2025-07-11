enum Currency {
  ruble(symbol: '₽', code: 'RUB'),
  usDollar(symbol: '\$', code: 'USD'),
  euro(symbol: '€', code: 'EUR');

  final String symbol;
  final String code;
  const Currency({required this.symbol, required this.code});

  static Currency fromCode(String code) => switch (code) {
        'RUB' => ruble,
        'USD' => usDollar,
        'EUR' => euro,
        _ => ruble,
      };
}
