import 'package:delivery_app/core/networking/api_result.dart';
import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';

abstract class MealsRepository {
  Future<ApiResult<List<MealEntity>>> getMeals();
  Future<ApiResult<MealEntity>> getMealById({required int id});
  Future<ApiResult<bool>> addToCart({
    required int mealId,
    required int quantity,
  });
}
