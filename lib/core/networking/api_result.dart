import 'package:delivery_app/core/error/failure.dart';

sealed class ApiResult<T> {
  const ApiResult();

  const factory ApiResult.success(T data) = Success;
  const factory ApiResult.failure(Failure failure) = FailureResult;

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) failure,
  }) {
    return switch (this) {
      final Success s => success(s.data as T),
      final FailureResult f => failure(f.failure),
    };
  }
}

final class Success<T> extends ApiResult<T> {
  const Success(this.data);
  final T data;
}

final class FailureResult<T> extends ApiResult<T> {
  const FailureResult(this.failure);
  final Failure failure;
}
