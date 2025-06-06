enum MainNavigationBarItemType {
  outcome(
    'Расходы',
    'OUTCOME',
  ),
  income(
    'Доходы',
    'INCOME',
  ),
  account(
    'Счет',
    'ACCOUNT',
  ),
  categories(
    'Статьи',
    'CATEGORIES',
  ),
  settings(
    'Настройки',
    'SETTINGS',
  );

  final String label;
  final String iconArtboard;

  static MainNavigationBarItemType? tryParse(String? value) {
    for (final type in values) {
      if (type.name == value) return type;
    }
    return null;
  }

  const MainNavigationBarItemType(
    this.label,
    this.iconArtboard,
  );
}
