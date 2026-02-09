import 'package:delivery_app/core/networking/api_constant.dart';
import 'package:delivery_app/core/networking/auth/auth_event_bus.dart';
import 'package:delivery_app/core/networking/auth/refresh_result.dart';
import 'package:delivery_app/core/networking/auth/token_storage.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final Dio refreshDio;
  final AuthEventBus authEventBus;
  final TokenStorage tokenStorage;
  bool _isRefreshing = false;
  static const _retryHeader = 'x-retry-count';
  final List<_QueuedRequest> _queue = [];

  AuthInterceptor({
    required this.dio,
    required this.refreshDio,
    required this.authEventBus,
    required this.tokenStorage,
  });
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await tokenStorage.getAcessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final status = err.response?.statusCode;
    if ((status != 401 || status != 403) ||
        err.requestOptions.path.contains(ApiConstant.refreshEndpoint)) {
      return handler.reject(err);
    }
    final retries = (err.requestOptions.headers[_retryHeader] ?? 0) as int;
    if (retries >= 1) return handler.reject(err);
    _queue.add(_QueuedRequest(error: err, handler: handler));

    if (!_isRefreshing) {
      _isRefreshing = true;
      final refreshToken = await _refreshToken();
      _isRefreshing = false;

      final currentQueue = List<_QueuedRequest>.from(_queue);
      for (var queueError in currentQueue) {
        if (refreshToken == RefreshResult.success) {
          _retry(queueError.error, queueError.handler);
        } else {
          queueError.handler.reject(queueError.error);
        }
      }
      if (refreshToken == RefreshResult.unauthorized) {
        await tokenStorage.clear();
        authEventBus.emit(AuthEvent.logout);
      }
    }
  }

  Future<dynamic> _refreshToken() async {
    try {
      final refreshToken = await tokenStorage.getRefreshToken();
      if (refreshToken == null) return RefreshResult.unauthorized;
      final response = await refreshDio.post(
        ApiConstant.refreshEndpoint,
        data: {'refreshToken': refreshToken},
      );
      await tokenStorage.saveTokens(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
      );
      return RefreshResult.success;
    } on DioException catch (error) {
      final statusCode = error.response?.statusCode;
      return (statusCode == 401 || statusCode == 403)
          ? RefreshResult.unauthorized
          : RefreshResult.transientError;
    }
  }

  void _retry(DioException error, ErrorInterceptorHandler handler) async {
    try {
      final accessToken = await tokenStorage.getAcessToken();
      final options = error.requestOptions.copyWith(
        headers: {
          ...error.requestOptions.headers,
          _retryHeader: 1,
          'Authorization': 'Bearer $accessToken',
        },
      );
      final response = await dio.fetch(options);
      handler.resolve(response);
    } catch (_) {
      handler.reject(error);
    }
  }
}

class _QueuedRequest {
  final DioException error;
  final ErrorInterceptorHandler handler;

  const _QueuedRequest({required this.error, required this.handler});
}
