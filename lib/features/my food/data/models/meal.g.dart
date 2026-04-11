// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
  imageUrl: json['imageUrl'] as String,
  rating: (json['rating'] as num?)?.toDouble(),
  category: json['category'] as String?,
  isAvailable: json['isAvailable'] as bool?,
);

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'imageUrl': instance.imageUrl,
  'rating': instance.rating,
  'category': instance.category,
  'isAvailable': instance.isAvailable,
};
