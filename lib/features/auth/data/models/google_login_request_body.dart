
import 'package:json_annotation/json_annotation.dart';

part 'google_login_request_body.g.dart';

@JsonSerializable(createFactory: false)
class GoogleLoginRequestBody {
  final String idToken;

  const GoogleLoginRequestBody({required this.idToken});

  Map<String, dynamic> toJson()=>_$GoogleLoginRequestBodyToJson(this);
  
}