
import 'package:delivery_app/features/auth/data/models/auth_response_body.dart';

sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthResponseBody authResponseBody;
  LoginSuccess({required this.authResponseBody});
}

class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}
