import 'package:delivery_app/core/error/exception_handler.dart';
import 'package:delivery_app/core/error/handlers/dio_exception_handler.dart';
import 'package:dio/dio.dart';

class ExceptionManager {
  static Map<Type, ExceptionHandler> handlers = {
    DioException: DioExceptionHandler(),
  };

  static String getMessage(Exception exception) {
  
      if (exception is FormatException) {
        return exception.message;
      }

      return exception.toString();
    }
  

  static String getIconPath(Exception exception) {
    return handlers[exception.runtimeType]!.getIconPath(exception);
  }
}
