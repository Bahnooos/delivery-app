
import 'package:json_annotation/json_annotation.dart';
part 'resend_v_code_response.g.dart';

@JsonSerializable()
class ResendVCodeResponse {
  final String message;

  ResendVCodeResponse({required this.message});

  factory ResendVCodeResponse.fromJson(Map<String, dynamic> json)=>_$ResendVCodeResponseFromJson(json);
}