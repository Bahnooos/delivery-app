// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartRequestBody _$AddToCartRequestBodyFromJson(
  Map<String, dynamic> json,
) => AddToCartRequestBody(
  mealId: (json['mealId'] as num).toInt(),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$AddToCartRequestBodyToJson(
  AddToCartRequestBody instance,
) => <String, dynamic>{
  'mealId': instance.mealId,
  'quantity': instance.quantity,
};
