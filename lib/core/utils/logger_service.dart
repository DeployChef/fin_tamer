import 'package:logger/logger.dart';
import 'package:fin_tamer/core/config/app_config.dart';

class SerilogPrinter extends LogPrinter {
  static const _reset = '\x1B[0m';
  static const _gray = '\x1B[90m';
  static const _blue = '\x1B[34m';
  static const _yellow = '\x1B[33m';
  static const _red = '\x1B[31m';
  static const _magenta = '\x1B[35m';
  static const _green = '\x1B[32m';

  static final Map<Level, String> _levelPrefixes = {
    Level.verbose: 'VRB',
    Level.debug: 'DBG',
    Level.info: 'INF',
    Level.warning: 'WRN',
    Level.error: 'ERR',
    Level.wtf: 'FTL',
  };

  static final Map<Level, String> _levelColors = {
    Level.verbose: _green,
    Level.debug: _blue,
    Level.info: _gray,
    Level.warning: _yellow,
    Level.error: _red,
    Level.wtf: _magenta,
  };

  @override
  List<String> log(LogEvent event) {
    final time = DateTime.now().toIso8601String().replaceFirst('T', ' ').substring(0, 19);
    final level = _levelPrefixes[event.level] ?? event.level.toString().toUpperCase();
    final color = _levelColors[event.level] ?? _reset;
    final msg = event.message;
    final error = event.error != null ? ' {Exception: ${event.error}}' : '';
    final stack = event.stackTrace != null ? '\n${event.stackTrace}' : '';
    return ['$color[$time $level]$_reset $msg$error$stack'];
  }
}

class LoggerService {
  static final Logger _logger = Logger(
    filter: AppConfig.enableNetworkLogging ? DevelopmentFilter() : ProductionFilter(),
    printer: SerilogPrinter(),
  );

  static Logger get logger => _logger;

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
