
  
import 'package:json_annotation/json_annotation.dart';

part 'verify_email_request_body.g.dart';

@JsonSerializable(createFactory: false)
class VerifyEmailRequestBody {
  final String email;
  final String otp;

 const VerifyEmailRequestBody({required this.email, required this.otp});

  Map<String, dynamic> toJson() => _$VerifyEmailRequestBodyToJson(this);
  
}