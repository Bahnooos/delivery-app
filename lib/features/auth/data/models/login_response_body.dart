
import 'package:json_annotation/json_annotation.dart';

part 'login_response_body.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponseBody {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? accessToken;
  final String? refreshToken;

  LoginResponseBody({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.accessToken,
    this.refreshToken,
  });

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}