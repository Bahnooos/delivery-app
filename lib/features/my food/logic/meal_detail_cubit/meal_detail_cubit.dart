import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';
import 'package:delivery_app/features/my%20food/domain/usecases/add_to_cart_use_case.dart';
import 'package:delivery_app/features/my%20food/domain/usecases/get_meal_by_id_use_case.dart';
import 'package:delivery_app/features/my%20food/logic/meal_detail_cubit/meal_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailCubit extends Cubit<MealDetailState> {
  MealDetailCubit({
    required this.getMealByIdUseCase,
    required this.addToCartUseCase,
  }) : super(MealDetailInitial());

  final GetMealByIdUseCase getMealByIdUseCase;
  final AddToCartUseCase addToCartUseCase;

  int _quantity = 1;
  MealEntity? _meal;

  int get quantity => _quantity;
  MealEntity? get meal => _meal;

  Future<void> loadMeal({required MealEntity meal}) async {
    _meal = meal;
    _quantity = 1;
    emit(MealDetailLoading());

    final response = await getMealByIdUseCase(id: meal.id);
    response.when(
      success: (loadedMeal) => emit(MealDetailSuccess(meal: loadedMeal)),
      failure: (_) => emit(MealDetailSuccess(meal: meal)),
    );
  }

  void incrementQuantity() {
    _quantity++;
    if (_meal != null) {
      emit(MealDetailSuccess(meal: _meal!));
    }
  }

  void decrementQuantity() {
    if (_quantity > 1) {
      _quantity--;
      if (_meal != null) {
        emit(MealDetailSuccess(meal: _meal!));
      }
    }
  }

  Future<void> addToCart() async {
    if (_meal == null) return;
    emit(AddToCartLoading());
    final response = await addToCartUseCase(
      mealId: _meal!.id,
      quantity: _quantity,
    );
    response.when(
      success: (_) => emit(AddToCartSuccess(meal: _meal!)),
      failure: (error) => emit(AddToCartError(failure: error)),
    );
  }
}
