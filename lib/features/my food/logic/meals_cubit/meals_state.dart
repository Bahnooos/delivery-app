import 'package:delivery_app/core/error/failure.dart';
import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';

sealed class MealsState {}

class MealsInitial extends MealsState {}

class MealsLoading extends MealsState {}

class MealsSuccess extends MealsState {
  final List<MealEntity> meals;
  MealsSuccess({required this.meals});
}

class MealsError extends MealsState {
  final Failure failure;
  MealsError({required this.failure});
}
