
import 'package:json_annotation/json_annotation.dart';
part 'facebook_login_request_body.g.dart';

@JsonSerializable(createFactory: false)
class FacebookLoginRequestBody {
  final String accessToken;

 const FacebookLoginRequestBody({required this.accessToken});

  Map<String, dynamic> toJson()=>_$FacebookLoginRequestBodyToJson(this);
  }
