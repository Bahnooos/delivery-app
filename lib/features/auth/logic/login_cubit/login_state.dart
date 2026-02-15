
import 'package:delivery_app/features/auth/data/models/login_response.dart';

sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;
  LoginSuccess({required this.loginResponse});
}

class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}
