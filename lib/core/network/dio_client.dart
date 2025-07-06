import 'package:dio/dio.dart';
import 'package:fin_tamer/core/config/app_config.dart';
import 'package:fin_tamer/core/utils/logger_service.dart';

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
    // Interceptor для авторизации
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer ${AppConfig.authToken}';
          LoggerService.networkRequest(
            options.method,
            options.path,
            headers: options.headers,
            body: options.data,
          );
          handler.next(options);
        },
        onResponse: (response, handler) {
          LoggerService.networkResponse(
            response.statusCode ?? 0,
            response.requestOptions.path,
            data: response.data,
          );
          handler.next(response);
        },
        onError: (error, handler) {
          LoggerService.networkError(
            error.response?.statusCode,
            error.requestOptions.path,
            message: error.message,
            error: error,
          );
          handler.next(error);
        },
      ),
    );
  }
}
