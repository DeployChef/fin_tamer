import 'package:dio/dio.dart';
import 'package:fin_tamer/core/config/app_config.dart';
import 'package:fin_tamer/core/utils/logger_service.dart';
import 'retry_interceptor.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  Dio get dio => _dio;

  void _setupInterceptors() {
    // Retry interceptor (должен быть первым)
    _dio.interceptors.add(RetryInterceptor());

    // Interceptor для авторизации и логирования
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer ${AppConfig.authToken}';
          LoggerService.networkRequest(
            options.method,
            options.path,
            tag: 'DioClient',
          );
          handler.next(options);
        },
        onResponse: (response, handler) {
          LoggerService.networkResponse(
            response.statusCode ?? 0,
            response.requestOptions.path,
            tag: 'DioClient',
          );
          handler.next(response);
        },
        onError: (error, handler) {
          LoggerService.networkError(
            error.response?.statusCode,
            error.requestOptions.path,
            message: error.message,
            error: error,
            tag: 'DioClient',
          );
          handler.next(error);
        },
      ),
    );
  }
}
