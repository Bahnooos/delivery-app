import 'package:delivery_app/core/networking/api_constant.dart';
import 'package:delivery_app/core/networking/auth/auth_event_bus.dart';
import 'package:delivery_app/core/networking/auth/auth_interceptor.dart';
import 'package:delivery_app/core/networking/auth/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio? refreshDio;
  static Dio getDio({required TokenStorage tokenStorage, required AuthEventBus authEventBus}) {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      dio!.interceptors.add(
        AuthInterceptor(
          dio: dio!,
          refreshDio: _getRefreshDio(timeOut),
          authEventBus: authEventBus,
          tokenStorage: tokenStorage,
        ),
      );
    }

    return dio!;
  }

  static Dio _getRefreshDio(Duration timeOut) {
    if (refreshDio != null) return refreshDio!;
    refreshDio = Dio(
      BaseOptions(baseUrl: ApiConstant.baseUrl, connectTimeout: timeOut, receiveTimeout: timeOut),
    );
    if (kDebugMode) {
      refreshDio!.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
        ),
      );
    }
    return refreshDio!;
  }

  static void addHeader() {
    dio?.options.headers = {};
  }

  static void addDioInterceptor() {
    if (!kReleaseMode) {
      dio?.interceptors.add(
        PrettyDioLogger(requestHeader: true, requestBody: true, request: true, error: true),
      );
    }
  }
}
