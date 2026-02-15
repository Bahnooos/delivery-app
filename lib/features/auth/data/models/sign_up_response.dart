
import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable(createToJson: false)
class SignUpResponse {
  final String message;

  const SignUpResponse({required this.message});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);
}
