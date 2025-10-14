import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokeapp/core/error/exceptions.dart';
import 'package:pokeapp/core/network/api_constants.dart';
import 'package:pokeapp/core/utils/logger.dart';

/// Dio client for HTTP requests
class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        headers: ApiConstants.defaultHeaders,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Log request
          AppLogger.info(
            '🌐 REQUEST[${options.method}] => PATH: ${options.path}',
          );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Log response
          AppLogger.info(
              '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',);
          log('Response Data: ${jsonEncode(response.data)}');
          return handler.next(response);
        },
        onError: (error, handler) {
          // Log error
          AppLogger.info(
              '❌ ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');
          return handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;

  /// GET request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// POST request
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// PUT request
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// DELETE request
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Handle Dio errors and convert to app exceptions
  AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException('Tiempo de espera agotado', 408);

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? error.message;

        switch (statusCode) {
          case 400:
            return ValidationException(message, statusCode);
          case 401:
            return UnauthorizedException(message, statusCode);
          case 404:
            return NotFoundException(message, statusCode);
          case 500:
          case 502:
          case 503:
            return ServerException(message, statusCode);
          default:
            return ServerException(message, statusCode);
        }

      case DioExceptionType.cancel:
        return AppException('Solicitud cancelada');

      case DioExceptionType.connectionError:
        return NetworkException('Sin conexión a internet');

      case DioExceptionType.badCertificate:
        return ServerException('Certificado inválido');

      case DioExceptionType.unknown:
        return AppException(error.message ?? 'Error desconocido');
    }
  }
}
