import 'package:delivery_app/features/my%20food/data/models/meal.dart';
import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';

extension MealMapper on Meal {
  MealEntity toEntity() {
    return MealEntity(
      id: id,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
      rating: rating,
      category: category,
      isAvailable: isAvailable,
    );
  }
}

extension MealEntityMapper on MealEntity {
  Meal toModel() {
    return Meal(
      id: id,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
      rating: rating,
      category: category,
      isAvailable: isAvailable,
    );
  }
}
