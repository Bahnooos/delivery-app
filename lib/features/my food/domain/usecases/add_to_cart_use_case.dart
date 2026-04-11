import 'package:delivery_app/core/networking/api_result.dart';
import 'package:delivery_app/features/my%20food/domain/repository/meals_repository.dart';

class AddToCartUseCase {
  final MealsRepository repository;

  AddToCartUseCase(this.repository);

  Future<ApiResult<bool>> call({required int mealId, required int quantity}) async {
    return repository.addToCart(mealId: mealId, quantity: quantity);
  }
}
