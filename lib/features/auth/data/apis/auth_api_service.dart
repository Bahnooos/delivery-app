import 'package:delivery_app/features/auth/data/models/facebook_login_request_body.dart';
import 'package:delivery_app/features/auth/data/models/google_login_request_body.dart';
import 'package:delivery_app/features/auth/data/models/login_response.dart';
import 'package:delivery_app/features/auth/data/models/resend_v_code_request_body.dart';
import 'package:delivery_app/features/auth/data/models/resend_v_code_response.dart';
import 'package:delivery_app/features/auth/data/models/sign_up_request_body.dart';
import 'package:delivery_app/features/auth/data/models/sign_up_response.dart';
import 'package:delivery_app/features/auth/data/models/verify_email_request_body.dart';
import 'package:delivery_app/features/auth/data/models/verify_email_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constant.dart';
import '../models/login_request_body.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST(ApiConstant.signUpEndpoint)
  Future<SignUpResponse> signUp(
    @Body() SignUpRequestBody signUpRequestBody,
  );

  @POST(ApiConstant.loginEndpoint)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @POST(ApiConstant.verifyEndpoint)
  Future<VerifyEmailResponse> verifyEmail(
    @Body() VerifyEmailRequestBody verifyEmailRequestBody,
  );
  @POST(ApiConstant.facebookEndpoint)
  Future<LoginResponse> facebookLogin(
    @Body() FacebookLoginRequestBody facebookLoginRequestBody,
  );
  @POST(ApiConstant.googleEndpoint)
  Future<LoginResponse> googleLogin(
    @Body() GoogleLoginRequestBody googleLoginRequestBody,
  );
  @POST(ApiConstant.resendVCodeEndpoint)
  Future<ResendVCodeResponse> resendVerificationCode(
    @Body() ResendVCodeRequestBody resendVCodeRequestBody,
  );

}
