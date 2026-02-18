import 'package:delivery_app/core/error/exception_handler.dart';
import 'package:delivery_app/core/error/failure.dart';
import 'package:delivery_app/core/error/handlers/dio_exception_handler.dart';
import 'package:dio/dio.dart';

class ExceptionManager {
  static Map<Type, ExceptionHandler> handlers = {
    DioException: DioExceptionHandler(),
  };

  static Failure handle(Exception exception) {
  final handler = handlers[exception.runtimeType];

  if (handler != null) {
    return handler.handle(exception);
  }

  return const Failure(
    message: 'Unexpected error occurred',
    icon: 'assets/images/errors/error.png',
  ); }

}
