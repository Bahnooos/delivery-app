import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(createToJson: true)
class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? description;
  final String? profileImageUrl;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.description,
    this.profileImageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
