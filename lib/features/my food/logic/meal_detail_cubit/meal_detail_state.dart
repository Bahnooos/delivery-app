import 'package:delivery_app/core/error/failure.dart';
import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';

sealed class MealDetailState {}

class MealDetailInitial extends MealDetailState {}

class MealDetailLoading extends MealDetailState {}

class MealDetailSuccess extends MealDetailState {
  final MealEntity meal;
  MealDetailSuccess({required this.meal});
}

class MealDetailError extends MealDetailState {
  final Failure failure;
  MealDetailError({required this.failure});
}

class AddToCartLoading extends MealDetailState {}

class AddToCartSuccess extends MealDetailState {
  final MealEntity meal;
  AddToCartSuccess({required this.meal});
}

class AddToCartError extends MealDetailState {
  final Failure failure;
  AddToCartError({required this.failure});
}
