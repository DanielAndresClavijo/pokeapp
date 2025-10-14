/// Base class for all exceptions in the application
class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, [this.statusCode]);

  @override
  String toString() => 'AppException: $message (Status: $statusCode)';
}

/// Server-related exceptions
class ServerException extends AppException {
  ServerException([super.message = 'Error del servidor', super.statusCode]);
}

/// Network-related exceptions
class NetworkException extends AppException {
  NetworkException(
      [super.message = 'Sin conexión a internet', super.statusCode]);
}

/// Cache-related exceptions
class CacheException extends AppException {
  CacheException(
      [super.message = 'Error al acceder a la caché', super.statusCode]);
}

/// Not found exceptions
class NotFoundException extends AppException {
  NotFoundException(
      [super.message = 'Recurso no encontrado', super.statusCode = 404]);
}

/// Validation exceptions
class ValidationException extends AppException {
  ValidationException(
      [super.message = 'Error de validación', super.statusCode]);
}

/// Unauthorized exceptions
class UnauthorizedException extends AppException {
  UnauthorizedException(
      [super.message = 'No autorizado', super.statusCode = 401]);
}

/// Timeout exceptions
class TimeoutException extends AppException {
  TimeoutException(
      [super.message = 'Tiempo de espera agotado', super.statusCode = 408]);
}

/// Parsing exceptions
class ParsingException extends AppException {
  ParsingException(
      [super.message = 'Error al procesar datos', super.statusCode]);
}
