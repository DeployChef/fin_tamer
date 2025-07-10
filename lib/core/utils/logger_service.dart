import 'package:logger/logger.dart';
import 'package:fin_tamer/core/config/app_config.dart';
import 'dart:convert'; // Added for JsonEncoder

// Новый форматтер логов с поддержкой тегов, pretty-print и структурой
class StructuredLogPrinter extends LogPrinter {
  static const _reset = '\x1B[0m';
  static const _gray = '\x1B[90m';
  static const _blue = '\x1B[34m';
  static const _yellow = '\x1B[33m';
  static const _red = '\x1B[31m';
  static const _green = '\x1B[32m';

  static final Map<Level, String> _levelPrefixes = {
    Level.debug: 'DBG',
    Level.info: 'INF',
    Level.warning: 'WRN',
    Level.error: 'ERR',
  };

  static final Map<Level, String> _levelColors = {
    Level.debug: _blue,
    Level.info: _gray,
    Level.warning: _yellow,
    Level.error: _red,
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
    final time = DateTime.now()
        .toIso8601String()
        .replaceFirst('T', ' ')
        .substring(0, 19);
    final level =
        _levelPrefixes[event.level] ?? event.level.toString().toUpperCase();
    final color = _levelColors[event.level] ?? _reset;
    String tag = '';
    String msg = event.message;
    // Попытка вытащить тег из сообщения вида [TAG] message
    final tagMatch = RegExp(r'^\[(.*?)\]\s?(.*)').firstMatch(msg);
    if (tagMatch != null) {
      tag = '[${tagMatch.group(1)}]';
      msg = tagMatch.group(2) ?? '';
    }
    // Pretty print для объектов
    if (msg.length > _maxMsgLength) {
      msg = msg.substring(0, _maxMsgLength) + '... (truncated)';
    }
    // Ошибка и stacktrace
    final error =
        event.error != null ? '\n  Exception: ${_pretty(event.error)}' : '';
    final stack =
        event.stackTrace != null ? '\n  Stack: ${event.stackTrace}' : '';
    return ['$color[$time][$level]$tag$_reset $msg$error$stack'];
  }
}

class LoggerService {
  static final Logger _logger = Logger(
    filter: AppConfig.enableNetworkLogging
        ? DevelopmentFilter()
        : ProductionFilter(),
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

  static void error(String message,
      [dynamic error, StackTrace? stackTrace, String? tag, Object? data]) {
    _logger.e(_compose(message, tag: tag, data: data),
        error: error, stackTrace: stackTrace);
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
      _logger.i(_compose('RESPONSE: $statusCode $path [${ok ? 'OK' : 'FAIL'}]',
          tag: tag));
    }
  }

  static void networkError(int? statusCode, String path,
      {String? message, dynamic error, String? tag}) {
    if (AppConfig.enableNetworkLogging) {
      _logger.e(
          _compose(
              'ERROR: $statusCode $path${message != null ? ' ($message)' : ''}',
              tag: tag),
          error: error,
          stackTrace: StackTrace.current);
    }
  }

  static void networkRetry(
      String path, int retryCount, int delaySeconds, int? statusCode,
      {String? tag}) {
    if (AppConfig.enableNetworkLogging) {
      _logger.w(_compose(
          'RETRY: $path (attempt $retryCount, delay ${delaySeconds}s, original status: $statusCode)',
          tag: tag));
    }
  }
}
