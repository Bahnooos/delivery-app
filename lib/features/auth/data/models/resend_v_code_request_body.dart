

import 'package:json_annotation/json_annotation.dart';
part 'resend_v_code_request_body.g.dart';

@JsonSerializable(createFactory: false)
class ResendVCodeRequestBody {
  final String email;

 const ResendVCodeRequestBody({required this.email});

  Map<String, dynamic> toJson()=>_$ResendVCodeRequestBodyToJson(this);
}