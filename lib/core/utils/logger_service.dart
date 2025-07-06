import 'package:logger/logger.dart';
import 'package:fin_tamer/core/config/app_config.dart';

class LoggerService {
  static final Logger _logger = Logger(
    filter: AppConfig.enableNetworkLogging ? DevelopmentFilter() : ProductionFilter(),
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static Logger get logger => _logger;

  // Методы для удобного логирования
  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  // Специальные методы для сетевого логирования
  static void networkRequest(String method, String path, {Map<String, dynamic>? headers, dynamic body}) {
    if (AppConfig.enableNetworkLogging) {
      _logger.i('🌐 REQUEST: $method $path');
      if (headers != null) _logger.d('Headers: $headers');
      if (body != null) _logger.d('Body: $body');
    }
  }

  static void networkResponse(int statusCode, String path, {dynamic data}) {
    if (AppConfig.enableNetworkLogging) {
      _logger.i('✅ RESPONSE: $statusCode $path');
      if (data != null) _logger.d('Data: $data');
    }
  }

  static void networkError(int? statusCode, String path, {String? message, dynamic error}) {
    if (AppConfig.enableNetworkLogging) {
      _logger.e('❌ ERROR: $statusCode $path', error: error, stackTrace: StackTrace.current);
    }
  }

  static void networkRetry(String path, int retryCount, int delaySeconds, int? statusCode) {
    if (AppConfig.enableNetworkLogging) {
      _logger.w('🔄 RETRY: $path (attempt $retryCount, delay ${delaySeconds}s, original status: $statusCode)');
    }
  }
}
