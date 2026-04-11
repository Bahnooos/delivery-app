import 'package:delivery_app/core/error/exception_manager.dart';
import 'package:delivery_app/core/networking/api_result.dart';
import 'package:delivery_app/features/my%20food/data/apis/meals_api_service.dart';
import 'package:delivery_app/features/my%20food/data/mappers/meal_mapper.dart';
import 'package:delivery_app/features/my%20food/data/models/add_to_cart_request_body.dart';
import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';
import 'package:delivery_app/features/my%20food/domain/repository/meals_repository.dart';

class MealsRepoImpl implements MealsRepository {
  final MealsApiService mealsApiService;

  MealsRepoImpl({required this.mealsApiService});

  @override
  Future<ApiResult<List<MealEntity>>> getMeals() async {
    try {
      final response = await mealsApiService.getMeals();
      final meals = response.map((meal) => meal.toEntity()).toList();
      return ApiResult.success(meals);
    } catch (error) {
      return ApiResult.failure(ExceptionManager.handle(error as Exception));
    }
  }

  @override
  Future<ApiResult<MealEntity>> getMealById({required int id}) async {
    try {
      final response = await mealsApiService.getMealById(id);
      return ApiResult.success(response.toEntity());
    } catch (error) {
      return ApiResult.failure(ExceptionManager.handle(error as Exception));
    }
  }

  @override
  Future<ApiResult<bool>> addToCart({
    required int mealId,
    required int quantity,
  }) async {
    try {
      await mealsApiService.addToCart(
        AddToCartRequestBody(mealId: mealId, quantity: quantity),
      );
      return const ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(ExceptionManager.handle(error as Exception));
    }
  }
}
