
import 'package:delivery_app/features/auth/data/models/auth_response_body.dart';

sealed class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final AuthResponseBody authResponseBody;
  SignUpSuccess({required this.authResponseBody});
}

class SignUpError extends SignUpState {
  final String error;
  SignUpError({required this.error});
}
