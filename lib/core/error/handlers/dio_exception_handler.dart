import 'package:dio/dio.dart';
import 'package:delivery_app/core/error/exception_handler.dart';

class DioExceptionHandler implements ExceptionHandler {
  final bool isArabic = false;

  @override
  String getIconPath(Exception exception) {
    if (exception is! DioException) {
      return 'assets/images/errors/error.png';
    }

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'assets/icons/timeout.svg';

      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        if (statusCode == 401 || statusCode == 403) {
          return AppAssets.error;
        } else if (statusCode == 404) {
          return AppAssets.noDataFound;
        } else if (statusCode != null && statusCode >= 500) {
          return AppAssets.serverError;
        }
        return AppAssets.error;

      case DioExceptionType.connectionError:
        return AppAssets.noInterNet;
      case DioExceptionType.badCertificate:
        return AppAssets.error;
      case DioExceptionType.cancel:
        return AppAssets.error;
      case DioExceptionType.unknown:
      default:
        return AppAssets.error;
    }
  }

  @override
  String getMessage(Exception exception) {
    if (exception is! DioException) {
      return isArabic ? 'حدث خطأ غير متوقع' : 'An unexpected error occurred';
    }

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return isArabic ? 'انتهت مهلة الاتصال.' : 'Connection timeout.';

      case DioExceptionType.sendTimeout:
        return isArabic ? 'انتهت مهلة إرسال البيانات.' : 'Send timeout.';

      case DioExceptionType.receiveTimeout:
        return isArabic ? 'انتهت مهلة استقبال البيانات.' : 'Receive timeout.';

      case DioExceptionType.badResponse:
        return _getResponseMessage(exception);

      case DioExceptionType.connectionError:
        return isArabic
            ? 'لا يوجد اتصال بالإنترنت. يرجى التحقق من الاتصال'
            : 'No internet connection. Please check your connection';

      case DioExceptionType.badCertificate:
        return isArabic
            ? 'خطأ في شهادة الأمان. ً'
            : 'Security certificate error.';

      case DioExceptionType.cancel:
        return isArabic ? 'تم إلغاء الطلب' : 'Request was cancelled';

      case DioExceptionType.unknown:
      default:
        return isArabic
            ? 'حدث خطأ غير متوقع.'
            : 'An unexpected error occurred.';
    }
  }

  String _getResponseMessage(DioException exception) {
    final statusCode = exception.response?.statusCode;

    if (statusCode == null) {
      return isArabic
          ? 'حدث خطأ في الاتصال بالخادم'
          : 'Server connection error';
    }

    switch (statusCode) {
      case 400:
        return isArabic
            ? 'طلب غير صحيح. يرجى التحقق من البيانات'
            : 'Bad request. Please check your data';

      case 401:
        return isArabic
            ? 'غير مصرح. يرجى تسجيل الدخول مرة أخرى'
            : 'Unauthorized. Please login again';

      case 403:
        return isArabic
            ? 'ممنوع. ليس لديك صلاحية الوصول'
            : 'Forbidden. You don\'t have access';

      case 404:
        return isArabic ? 'المورد غير موجود' : 'Resource not found';

      case 408:
        return isArabic ? 'انتهت مهلة الطلب.' : 'Request timeout.';

      case 422:
        return isArabic
            ? 'البيانات المدخلة غير صحيحة'
            : 'Invalid data provided';

      case 429:
        return isArabic ? 'عدد كبير جداً من الطلبات. ً' : 'Too many requests.';

      case 500:
        return isArabic ? 'خطأ في الخادم. ً' : 'Server error.';

      case 502:
        return isArabic ? 'خطأ في البوابة. ً' : 'Bad gateway.';

      case 503:
        return isArabic ? 'الخدمة غير متاحة حالياً. ً' : 'Service unavailable.';

      case 504:
        return isArabic ? 'انتهت مهلة البوابة. ً' : 'Gateway timeout.';

      default:
        if (statusCode >= 500) {
          return isArabic ? 'خطأ في الخادم. ً' : 'Server error.';
        } else if (statusCode >= 400) {
          return isArabic ? 'حدث خطأ في الطلب.' : 'Request error.';
        }
        return isArabic ? 'حدث خطأ غير متوقع' : 'An unexpected error occurred';
    }
  }
}
