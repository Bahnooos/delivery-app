import 'package:delivery_app/core/networking/api_result.dart';
import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';
import 'package:delivery_app/features/my%20food/domain/repository/meals_repository.dart';

class GetMealByIdUseCase {
  final MealsRepository repository;

  GetMealByIdUseCase(this.repository);

  Future<ApiResult<MealEntity>> call({required int id}) async {
    return repository.getMealById(id: id);
  }
}
