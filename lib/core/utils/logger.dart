/// Logger utility for the application
class AppLogger {
  AppLogger._();

  static const bool _isDebugMode = true;

  /// Log information
  static void info(String message, [String? tag]) {
    if (_isDebugMode) {
      print('ℹ️ ${tag != null ? '[$tag] ' : ''}$message');
    }
  }

  /// Log debug information
  static void debug(String message, [String? tag]) {
    if (_isDebugMode) {
      print('🐛 ${tag != null ? '[$tag] ' : ''}$message');
    }
  }

  /// Log warnings
  static void warning(String message, [String? tag]) {
    if (_isDebugMode) {
      print('⚠️ ${tag != null ? '[$tag] ' : ''}$message');
    }
  }

  /// Log errors
  static void error(String message,
      [String? tag, Object? error, StackTrace? stackTrace]) {
    if (_isDebugMode) {
      print('❌ ${tag != null ? '[$tag] ' : ''}$message');
      if (error != null) print('Error: $error');
      if (stackTrace != null) print('StackTrace: $stackTrace');
    }
  }

  /// Log success messages
  static void success(String message, [String? tag]) {
    if (_isDebugMode) {
      print('✅ ${tag != null ? '[$tag] ' : ''}$message');
    }
  }
}
