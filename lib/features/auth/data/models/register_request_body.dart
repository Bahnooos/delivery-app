
import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;

  RegisterRequestBody({
   required this.firstName,
   required this.lastName,
   required this.email,
   required this.password,
   required this.phoneNumber,
  });

Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}