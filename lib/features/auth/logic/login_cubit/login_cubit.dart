import 'package:delivery_app/core/networking/api_result.dart';
import 'package:delivery_app/features/auth/data/models/login_request_body.dart';
import 'package:delivery_app/features/auth/data/repos/auth_repo.dart';
import 'package:delivery_app/features/auth/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitLoginStates() async {
    emit(LoginLoading());
    final respose = await authRepo.login(
      loginRequestBody: LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    respose.when(
      success: (data) => emit(LoginSuccess(authResponseBody: data)),
      failure: (error) => emit(LoginError(error: error)),
    );
  }
}
