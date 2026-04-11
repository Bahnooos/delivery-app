import 'package:delivery_app/core/networking/api_result.dart';
import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';
import 'package:delivery_app/features/my%20food/domain/repository/meals_repository.dart';

class GetMealsUseCase {
  final MealsRepository repository;

  GetMealsUseCase(this.repository);

  Future<ApiResult<List<MealEntity>>> call() async {
    return repository.getMeals();
  }
}
