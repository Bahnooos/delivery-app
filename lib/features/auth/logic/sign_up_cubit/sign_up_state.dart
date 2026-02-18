import 'package:delivery_app/core/error/failure.dart';
import 'package:delivery_app/features/auth/data/models/sign_up_response.dart';

sealed class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final SignUpResponse signUpResponse;
  SignUpSuccess({required this.signUpResponse});
}

class SignUpError extends SignUpState {
  final Failure failure;
  SignUpError({required this.failure});
}
