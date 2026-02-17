
import 'package:delivery_app/core/error/exception_manager.dart';
import 'package:delivery_app/core/networking/api_result.dart';
import 'package:delivery_app/features/auth/data/apis/auth_api_service.dart';
import 'package:delivery_app/features/auth/data/models/facebook_login_request_body.dart';
import 'package:delivery_app/features/auth/data/models/google_login_request_body.dart';
import 'package:delivery_app/features/auth/data/models/login_request_body.dart';
import 'package:delivery_app/features/auth/data/models/login_response.dart';
import 'package:delivery_app/features/auth/data/models/sign_up_request_body.dart';
import 'package:delivery_app/features/auth/data/models/sign_up_response.dart';
import 'package:delivery_app/features/auth/data/models/verify_email_request_body.dart';
import 'package:delivery_app/features/auth/data/models/verify_email_response.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final AuthApiService authApiService;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  AuthRepo({required this.authApiService});


  Future<ApiResult<SignUpResponse>> signUp({
    required SignUpRequestBody signUpRequestBody,
  }) async {
    try {
      final response = await authApiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ExceptionManager.getMessage(error as Exception));
    }
  }

  Future<ApiResult<LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    try {
      final response = await authApiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ExceptionManager.getMessage(error as Exception));
    }
  }

  Future<ApiResult<VerifyEmailResponse>> verify({
    required VerifyEmailRequestBody verifyEmailRequestBody,
  }) async {
    try {
      final response = await authApiService.verifyEmail(verifyEmailRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ExceptionManager.getMessage(e as Exception));
    }
  }

  Future<ApiResult<LoginResponse>> facebookLogin() async {
    try {
      final result = await _facebookAuth.login();
      if (result.status == LoginStatus.cancelled) {
        return ApiResult.failure("Login cancelled");
      }

      if (result.status != LoginStatus.success) {
        return ApiResult.failure("Facebook login failed");
      }

      final response = await authApiService.facebookLogin(
        FacebookLoginRequestBody(accessToken: result.accessToken!.token),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(
        ExceptionManager.getMessage(
          e is Exception ? e : Exception(e.toString()),
        ),
      );
    }
  }

  Future<ApiResult<LoginResponse>> googleLogin() async {
    try {
   

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final googleAuth = googleUser.authentication;
      if (googleAuth.idToken == null) {
        return ApiResult.failure("Failed to get Google authentication token");
      }

      final response = await authApiService.googleLogin(
        GoogleLoginRequestBody(idToken: googleAuth.idToken!),
      );

      return ApiResult.success(response);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return ApiResult.failure("Google Sign-In was cancelled");
      }
      return ApiResult.failure(
        "Google Sign-In failed: ${e.code} - Check your configuration",
      );
    } catch (e) {
      return ApiResult.failure(
        ExceptionManager.getMessage(
          e is Exception ? e : Exception(e.toString()),
        ),
      );
    }
  }
}
