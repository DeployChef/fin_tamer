class AppConfig {
  // Сетевые настройки
  static const String baseUrl = 'https://shmr-finance.ru/api/v1';
  static const String authToken = 'userName'; // Замените на ваш токен

  // Переключатели для тестирования
  static const bool useMockAccounts = false;
  static const bool useMockTransactions = false;
  static const bool useMockCategories = false;
  static const bool useMockHistory = false;

  // Настройки retry
  static const int maxRetries = 3;
  static const int retryDelaySeconds = 1;

  // Таймауты
  static const int connectionTimeoutSeconds = 30;
  static const int receiveTimeoutSeconds = 30;

  // Отладочные настройки
  static const bool enableNetworkLogging = true;
}
