import 'package:delivery_app/features/auth/data/models/auth_response_body.dart';
import 'package:delivery_app/features/auth/data/models/sign_up_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constant.dart';
import '../models/login_request_body.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST(ApiConstant.signUpEndpoint)
  Future<AuthResponseBody> signUp(
    @Body() SignUpRequestBody signUpRequestBody,
  );

  @POST(ApiConstant.loginEndpoint)
  Future<AuthResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

}
