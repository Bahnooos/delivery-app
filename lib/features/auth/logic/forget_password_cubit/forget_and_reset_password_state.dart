import 'package:delivery_app/core/error/failure.dart';

sealed class ForgetAndResetPasswordState {}

class ForgetAndResetPasswordInitialState extends ForgetAndResetPasswordState {}

class ForgetAndResetPasswordLoadingState extends ForgetAndResetPasswordState {}

class ForgetPasswordSuccessState<T> extends ForgetAndResetPasswordState {
  final T? data;

  ForgetPasswordSuccessState({required this.data});
}

class ForgetPasswordErrorState extends ForgetAndResetPasswordState {
  final Failure failure;

  ForgetPasswordErrorState({required this.failure});
}

class ResetPasswordSuccessState<T> extends ForgetAndResetPasswordState {
  final T? data;

  ResetPasswordSuccessState({required this.data});
}
class ResetPasswordErrorState extends ForgetAndResetPasswordState {
  final Failure failure;

  ResetPasswordErrorState({required this.failure});
}