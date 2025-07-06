import 'package:dio/dio.dart';
import 'package:fin_tamer/core/config/app_config.dart';
import 'package:fin_tamer/core/utils/logger_service.dart';
import 'dart:math';

class RetryInterceptor extends Interceptor {
  final int maxRetries;
  final int baseDelaySeconds;

  RetryInterceptor({
    this.maxRetries = AppConfig.maxRetries,
    this.baseDelaySeconds = AppConfig.retryDelaySeconds,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err) && _getRetryCount(err) < maxRetries) {
      final retryCount = _getRetryCount(err) + 1;
      final delay = _calculateDelay(retryCount);

      LoggerService.networkRetry(
        err.requestOptions.path,
        retryCount,
        delay,
        err.response?.statusCode,
      );

      await Future.delayed(Duration(seconds: delay));

      try {
        final response = await _retryRequest(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (retryError) {
        if (retryError is DioException) {
          _setRetryCount(retryError, retryCount);
          if (retryCount < maxRetries) {
            onError(retryError, handler);
            return;
          }
        }
        handler.reject(err);
        return;
      }
    }

    handler.reject(err);
  }

  bool _shouldRetry(DioException error) {
    final statusCode = error.response?.statusCode;
    return statusCode == 500 || statusCode == 502 || statusCode == 503 || statusCode == 504 || statusCode == 408 || statusCode == 429;
  }

  int _getRetryCount(DioException error) {
    return error.requestOptions.extra['retryCount'] ?? 0;
  }

  void _setRetryCount(DioException error, int count) {
    error.requestOptions.extra['retryCount'] = count;
  }

  int _calculateDelay(int retryCount) {
    final exponentialDelay = baseDelaySeconds * pow(2, retryCount - 1);
    final jitter = Random().nextInt(1000) / 1000;
    return (exponentialDelay + jitter).round();
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final dio = Dio();

    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      validateStatus: requestOptions.validateStatus,
      receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
      extra: requestOptions.extra,
    );

    return await dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
