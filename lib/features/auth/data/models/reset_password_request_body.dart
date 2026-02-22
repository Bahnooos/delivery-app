import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_body.g.dart';

@JsonSerializable(createFactory: false)
class ResetPasswordRequestBody {
  final String email;
  @JsonKey(name:'password')
  final String newPassword;
  final String otp;


 const ResetPasswordRequestBody({required this.email, required this.newPassword, required this.otp});

 Map<String, dynamic> toJson() => _$ResetPasswordRequestBodyToJson(this);
}
