import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  // Сетевые настройки
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static String get authToken => dotenv.env['AUTH_TOKEN'] ?? '';

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
