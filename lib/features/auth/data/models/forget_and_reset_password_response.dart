
import 'package:json_annotation/json_annotation.dart';

part 'forget_and_reset_password_response.g.dart';

@JsonSerializable(createToJson: false)
class ForgetAndResetPasswordResponse {
  final String message;

  ForgetAndResetPasswordResponse({required this.message});

  factory ForgetAndResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetAndResetPasswordResponseFromJson(json);
}
