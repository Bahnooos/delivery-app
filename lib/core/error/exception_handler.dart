abstract class ExceptionHandler {
  /// Returns a user-friendly message for the given exception.
  String getMessage(Exception exception);

  /// Returns the path to an icon representing the given exception.
  String getIconPath(Exception exception);
}
