import 'package:delivery_app/features/auth/data/apis/auth_api_service.dart';
import 'package:delivery_app/features/auth/data/models/auth_response_body.dart';
import 'package:delivery_app/features/auth/data/models/sign_up_request_body.dart';

class AuthRepo {
  final AuthApiService authApiService;

  AuthRepo({required this.authApiService});

  Future<AuthResponseBody> signUp({
    required SignUpRequestBody signUpRequestBody,
  }) async {
    try {
      final response = await authApiService.signUp(signUpRequestBody);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
 