import 'package:delivery_app/core/error/failure.dart';

abstract class ExceptionHandler {
  /// Returns a user-friendly message && Icon && Errors if Found for the given exception.
  Failure handle(Exception exception);
}
