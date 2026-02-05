import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  final int id;
  final String title;
  final String body;
  final DateTime createdAt;
  final bool isRead;

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
