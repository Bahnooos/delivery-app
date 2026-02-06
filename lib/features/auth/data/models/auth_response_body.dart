
import 'package:json_annotation/json_annotation.dart';

part 'auth_response_body.g.dart';

@JsonSerializable(createToJson: false)
class AuthResponseBody {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? accessToken;
  final String? refreshToken;

  AuthResponseBody({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.accessToken,
    this.refreshToken,
  });

  factory AuthResponseBody.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseBodyFromJson(json);
}