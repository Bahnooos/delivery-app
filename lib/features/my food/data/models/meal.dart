import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double? rating;
  final String? category;
  final bool? isAvailable;

  const Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.rating,
    this.category,
    this.isAvailable,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}
