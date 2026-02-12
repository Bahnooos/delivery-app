import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable(createToJson: false)
class ApiErrorModel {
  final String? type;
  final String? title;
  final int? status;
  @JsonKey(name: 'detail')
  final String? error;
  final String? instance;
  final String? traceId;

  ApiErrorModel({
    this.type,
    this.title,
    this.status,
    this.error,
    this.instance,
    this.traceId,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  String getAllErrorsMessages() {
    return error ?? '';
  }
}
