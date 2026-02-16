import 'package:delivery_app/core/networking/api_result.dart';
import 'package:delivery_app/core/networking/auth/token_storage.dart';
import 'package:delivery_app/features/auth/data/models/login_request_body.dart';
import 'package:delivery_app/features/auth/data/models/login_response.dart';
import 'package:delivery_app/features/auth/data/repos/auth_repo.dart';
import 'package:delivery_app/features/auth/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo, this.tokenStorage) : super(LoginInitial());
  final AuthRepo authRepo;
  final TokenStorage tokenStorage;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitLoginStates() async {
    emit(LoginLoading());
    final response = await authRepo.login(
      loginRequestBody: LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (data) => _handleSuccess(data: data),
      failure: (error) => emit(LoginError(error: error)),
    );
  }

  Future<void> facebookLogin() async {
    emit(LoginLoading());
    final response = await authRepo.facebookLogin();
    response.when(
      success: (data) => _handleSuccess(data: data),
      failure: (error) => emit(LoginError(error: error)),
    );
  }
  
  Future<void> googleLogin() async {
    emit(LoginLoading());
    final response = await authRepo.googleLogin();
    response.when(
      success: (data) => _handleSuccess(data: data),
      failure: (error) => emit(LoginError(error: error)),
    );
  }

  Future<void> _handleSuccess({required LoginResponse data}) async {
    if (data.accessToken == null || data.refreshToken == null) {
      emit(LoginError(error: 'Invalid Authentication response'));
      return;
    }
    await tokenStorage.saveTokens(
      accessToken: data.accessToken!,
      refreshToken: data.refreshToken!,
    );
    emit(LoginSuccess(loginResponse: data));
  }
}
