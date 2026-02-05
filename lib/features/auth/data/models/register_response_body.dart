
import 'package:json_annotation/json_annotation.dart';

part 'register_response_body.g.dart';

@JsonSerializable(createToJson: false)
class RegisterResponseBody {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? accessToken;
  final String? refreshToken;

  RegisterResponseBody({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.accessToken,
    this.refreshToken,
  });

  factory RegisterResponseBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseBodyFromJson(json);
}