

import 'package:json_annotation/json_annotation.dart';
part 'verify_email_response.g.dart';

@JsonSerializable(createToJson: false)
class VerifyEmailResponse {
  final String? accessToken;
  final String? refreshToken;

const  VerifyEmailResponse({required this.accessToken, required this.refreshToken});
factory VerifyEmailResponse.fromJson(Map<String,dynamic> json)=> _$VerifyEmailResponseFromJson(json);
}