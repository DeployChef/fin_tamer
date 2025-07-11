import 'package:logger/logger.dart';
import 'package:fin_tamer/core/config/app_config.dart';
import 'dart:convert'; // Added for JsonEncoder

// Новый форматтер логов с поддержкой тегов, pretty-print и структурой
class StructuredLogPrinter extends LogPrinter {
  static final Map<Level, String> _levelPrefixes = {
    Level.debug: 'DBG',
    Level.info: 'INF',
    Level.warning: 'WRN',
    Level.error: 'ERR',
  };

  static const int _maxMsgLength = 500;

  String _pretty(Object? obj) {
    if (obj == null) return '';
    if (obj is String) return obj;
    try {
      return const JsonEncoder.withIndent('  ').convert(obj);
    } catch (_) {
      return obj.toString();
    }
  }

  @override
  List<String> log(LogEvent event) {
    final time = DateTime.now().toIso8601String().replaceFirst('T', ' ').substring(0, 19);
    final level = _levelPrefixes[event.level] ?? event.level.toString().toUpperCase();
    String tag = '';
    String msg = event.message;
    final tagMatch = RegExp(r'^\[(.*?)\]\s?(.*)').firstMatch(msg);
    if (tagMatch != null) {
      tag = '[${tagMatch.group(1)}]';
      msg = tagMatch.group(2) ?? '';
    }
    // Разделяем message и data, если есть \n  Data:
    String mainMsg = msg;
    String? dataBlock;
    final dataIndex = msg.indexOf('\n  Data:');
    if (dataIndex != -1) {
      mainMsg = msg.substring(0, dataIndex);
      dataBlock = msg.substring(dataIndex + 1); // +1 чтобы убрать \n
      // Если dataBlock длинная, не обрезаем её
    } else {
      if (mainMsg.length > _maxMsgLength) {
        mainMsg = '${mainMsg.substring(0, _maxMsgLength)}... (truncated)';
      }
    }
    final error = event.error != null ? '\n  Exception: ${_pretty(event.error)}' : '';
    final stack = event.stackTrace != null ? '\n  Stack: ${event.stackTrace}' : '';
    // Plain text, без цветов, с разделителем
    final lines = <String>['---'];
    lines.add('[$time][$level]$tag $mainMsg$error$stack');
    if (dataBlock != null) {
      lines.add(dataBlock);
    }
    return lines;
  }
}

class LoggerService {
  static final Logger _logger = Logger(
    filter: AppConfig.enableNetworkLogging ? DevelopmentFilter() : ProductionFilter(),
    printer: StructuredLogPrinter(),
  );

  static Logger get logger => _logger;

  static void debug(String message, {String? tag, Object? data}) {
    _logger.d(_compose(message, tag: tag, data: data));
  }

  static void info(String message, {String? tag, Object? data}) {
    _logger.i(_compose(message, tag: tag, data: data));
  }

  static void warning(String message, {String? tag, Object? data}) {
    _logger.w(_compose(message, tag: tag, data: data));
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace, String? tag, Object? data]) {
    _logger.e(_compose(message, tag: tag, data: data), error: error, stackTrace: stackTrace);
  }

  static String _compose(String message, {String? tag, Object? data}) {
    final tagStr = tag != null ? '[$tag] ' : '';
    if (data != null) {
      return '$tagStr$message\n  Data: ${_pretty(data)}';
    }
    return '$tagStr$message';
  }

  static String _pretty(Object? obj) {
    if (obj == null) return '';
    if (obj is String) return obj;
    try {
      return const JsonEncoder.withIndent('  ').convert(obj);
    } catch (_) {
      return obj.toString();
    }
  }

  // Network logging: только статус запроса, без body/headers
  static void networkRequest(String method, String path, {String? tag}) {
    if (AppConfig.enableNetworkLogging) {
      _logger.i(_compose('REQUEST: $method $path', tag: tag));
    }
  }

  static void networkResponse(int statusCode, String path, {String? tag}) {
    if (AppConfig.enableNetworkLogging) {
      final ok = statusCode >= 200 && statusCode < 300;
      _logger.i(_compose('RESPONSE: $statusCode $path [${ok ? 'OK' : 'FAIL'}]', tag: tag));
    }
  }

  static void networkError(int? statusCode, String path, {String? message, dynamic error, String? tag}) {
    if (AppConfig.enableNetworkLogging) {
      _logger.e(_compose('ERROR: $statusCode $path${message != null ? ' ($message)' : ''}', tag: tag),
          error: error, stackTrace: StackTrace.current);
    }
  }

  static void networkRetry(String path, int retryCount, int delaySeconds, int? statusCode, {String? tag}) {
    if (AppConfig.enableNetworkLogging) {
      _logger.w(_compose('RETRY: $path (attempt $retryCount, delay ${delaySeconds}s, original status: $statusCode)', tag: tag));
    }
  }
}
