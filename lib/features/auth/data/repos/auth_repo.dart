import 'package:delivery_app/core/error/exception_manager.dart';
import 'package:delivery_app/core/networking/api_result.dart';
import 'package:delivery_app/features/auth/data/apis/auth_api_service.dart';
import 'package:delivery_app/features/auth/data/models/auth_response_body.dart';
import 'package:delivery_app/features/auth/data/models/login_request_body.dart';
import 'package:delivery_app/features/auth/data/models/sign_up_request_body.dart';

class AuthRepo {
  final AuthApiService authApiService;

  AuthRepo({required this.authApiService});

  Future<ApiResult<AuthResponseBody>> signUp({
    required SignUpRequestBody signUpRequestBody,
  }) async {
    try {
      final response = await authApiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ExceptionManager.getMessage(error as Exception));
    }
  }
  Future<ApiResult<AuthResponseBody>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    try {
      final response = await authApiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ExceptionManager.getMessage(error as Exception));
    }
  }
}
 