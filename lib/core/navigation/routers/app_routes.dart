enum AppRoutes {
  outcome(
    'OUTCOME',
    '/outcome',
  ),
  income(
    'INCOME',
    "/income",
  ),
  account(
    'ACCOUNT',
    '/account',
  ),
  categories(
    'CATEGORIES',
    '/categories',
  ),
  settings(
    'SETTINGS',
    '/settings',
  ),
  outcomeDetails(
    'OUTCOME_DETAILS',
    '/details',
  ),
  incomeDetails(
    'INCOME_DETAILS',
    '/details',
  ),
  incomeHistory(
    'INCOME_HISTORY',
    '/history',
  ),
  outcomeHistory(
    'OUTCOME_HISTORY',
    '/history',
  );

  final String name;
  final String path;

  static AppRoutes? tryParse(String? value) {
    for (final type in values) {
      if (type.name == value) return type;
    }
    return null;
  }

  const AppRoutes(
    this.name,
    this.path,
  );
}
