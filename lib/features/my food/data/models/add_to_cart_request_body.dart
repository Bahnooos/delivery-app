import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_request_body.g.dart';

@JsonSerializable()
class AddToCartRequestBody {
  final int mealId;
  final int quantity;

  const AddToCartRequestBody({
    required this.mealId,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() => _$AddToCartRequestBodyToJson(this);
}
