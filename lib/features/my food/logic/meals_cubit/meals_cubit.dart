import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';
import 'package:delivery_app/features/my%20food/domain/usecases/get_meals_use_case.dart';
import 'package:delivery_app/features/my%20food/logic/meals_cubit/meals_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsCubit(this.getMealsUseCase) : super(MealsInitial());
  final GetMealsUseCase getMealsUseCase;

  List<MealEntity> _allMeals = [];
  String _selectedCategory = 'All';

  String get selectedCategory => _selectedCategory;

  Future<void> emitMealsStates() async {
    emit(MealsLoading());
    final response = await getMealsUseCase();
    response.when(
      success: (meals) {
        _allMeals = meals;
        _emitFilteredMeals();
      },
      failure: (error) => emit(MealsError(failure: error)),
    );
  }

  void changeCategory(String category) {
    _selectedCategory = category;
    _emitFilteredMeals();
  }

  List<MealEntity> get filteredMeals {
    if (_selectedCategory == 'All') return _allMeals;
    return _allMeals
        .where(
          (meal) =>
              meal.category?.toLowerCase() == _selectedCategory.toLowerCase(),
        )
        .toList();
  }

  void _emitFilteredMeals() {
    emit(MealsSuccess(meals: filteredMeals));
  }
}
