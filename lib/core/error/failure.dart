import 'package:delivery_app/core/error/api_error_model.dart';

class Failure {
  final String? icon;
  final String? message;
  final ApiErrorModel? apiErrorModel;

  const Failure({this.icon, this.message, this.apiErrorModel});
}
