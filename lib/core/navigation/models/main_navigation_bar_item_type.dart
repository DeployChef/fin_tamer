enum MainNavigationBarItemType {
  outcome(
    'Расходы',
    'assets/icons/outcome.svg',
  ),
  income(
    'Доходы',
    'assets/icons/income.svg',
  ),
  account(
    'Счет',
    'assets/icons/account.svg',
  ),
  categories(
    'Статьи',
    'assets/icons/categories.svg',
  ),
  settings(
    'Настройки',
    'assets/icons/settings.svg',
  );

  final String label;
  final String iconAssetPath;

  static MainNavigationBarItemType? tryParse(String? value) {
    for (final type in values) {
      if (type.name == value) return type;
    }
    return null;
  }

  const MainNavigationBarItemType(
    this.label,
    this.iconAssetPath,
  );
}
