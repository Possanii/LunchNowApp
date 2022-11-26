import 'package:logger/logger.dart';
import 'package:lunch_now/app/core/logger/app_logger.dart';

class LoggerAppLoggerImpl implements AppLogger {
  final logger = Logger();
  var messages = <String>[];

  @override
  void append(message, [error, StackTrace? stackTrace]) {
    messages.add(message);
  }

  @override
  void closeAppend() {
    info(messages.join('\n'));
    messages = [];
  }

  @override
  void debug(message, [error, StackTrace? stackTrace]) =>
      logger.d(message, error, stackTrace);

  @override
  void error(message, [error, StackTrace? stackTrace]) =>
      logger.e(message, error, stackTrace);

  @override
  void info(message, [error, StackTrace? stackTrace]) =>
      logger.i(message, error, stackTrace);

  @override
  void warning(message, [error, StackTrace? stackTrace]) =>
      logger.w(message, error, stackTrace);
}
