import 'package:delivery_app/core/networking/api_service.dart';
import 'package:delivery_app/core/networking/auth/auth_event_bus.dart';
import 'package:delivery_app/core/networking/auth/token_storage.dart';
import 'package:delivery_app/core/networking/dio_factory.dart';
import 'package:delivery_app/features/auth/data/apis/auth_api_service.dart';
import 'package:delivery_app/features/auth/data/repos/auth_repo.dart';
import 'package:delivery_app/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:delivery_app/features/auth/logic/forget_password_cubit/forget_and_reset_password_cubit.dart';
import 'package:delivery_app/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:delivery_app/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:delivery_app/features/auth/logic/verify_cubit/verification_cubit.dart';
import 'package:delivery_app/features/my%20food/data/apis/meals_api_service.dart'
    as meals_api;
import 'package:delivery_app/features/my%20food/data/repos/meals_repo.dart'
    as meals_repo;
import 'package:delivery_app/features/my%20food/domain/repository/meals_repository.dart'
    as meals_repository;
import 'package:delivery_app/features/my%20food/domain/usecases/add_to_cart_use_case.dart'
    as add_to_cart_use_case;
import 'package:delivery_app/features/my%20food/domain/usecases/get_meal_by_id_use_case.dart'
    as get_meal_by_id_use_case;
import 'package:delivery_app/features/my%20food/domain/usecases/get_meals_use_case.dart'
    as get_meals_use_case;
import 'package:delivery_app/features/my%20food/logic/meal_detail_cubit/meal_detail_cubit.dart'
    as meal_detail_cubit;
import 'package:delivery_app/features/my%20food/logic/meals_cubit/meals_cubit.dart'
    as meals_cubit;
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/notification/data/repos/notification_repo.dart';
import '../../features/notification/logic/notification_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Secure Token Storage and Auth event bus
  getIt.registerLazySingleton<TokenStorage>(() => SecureTokenStorage());
  getIt.registerLazySingleton<AuthEventBus>(() => AuthEventBus());

  // Dio & API Service
  getIt.registerLazySingleton<Dio>(
    () => DioFactory.getDio(
      tokenStorage: getIt<TokenStorage>(),
      authEventBus: getIt<AuthEventBus>(),
    ),
  );
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(getIt()));

  // Features - Notification
  getIt.registerLazySingleton<NotificationRepo>(() => NotificationRepo());
  getIt.registerFactory<NotificationCubit>(() => NotificationCubit(getIt()));

  // Features Auth
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(authApiService: getIt()),
  );
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerFactory<VerificationCubit>(
    () => VerificationCubit(authRepo: getIt(), tokenStorage: getIt()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt(), getIt()));
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(authEventBus: getIt(), tokenStorage: getIt()),
  );
  getIt.registerLazySingleton<ForgetAndResetPasswordCubit>(
    () => ForgetAndResetPasswordCubit(authRepo: getIt()),
  );

  // Features - Meals
  getIt.registerLazySingleton<meals_api.MealsApiService>(
    () => meals_api.MealsApiService(getIt()),
  );
  getIt.registerLazySingleton<meals_repository.MealsRepository>(
    () => meals_repo.MealsRepoImpl(mealsApiService: getIt()),
  );
  getIt.registerLazySingleton<get_meals_use_case.GetMealsUseCase>(
    () => get_meals_use_case.GetMealsUseCase(getIt()),
  );
  getIt.registerLazySingleton<get_meal_by_id_use_case.GetMealByIdUseCase>(
    () => get_meal_by_id_use_case.GetMealByIdUseCase(getIt()),
  );
  getIt.registerLazySingleton<add_to_cart_use_case.AddToCartUseCase>(
    () => add_to_cart_use_case.AddToCartUseCase(getIt()),
  );
  getIt.registerFactory<meals_cubit.MealsCubit>(
    () => meals_cubit.MealsCubit(getIt()),
  );
  getIt.registerFactory<meal_detail_cubit.MealDetailCubit>(
    () => meal_detail_cubit.MealDetailCubit(
      getMealByIdUseCase: getIt(),
      addToCartUseCase: getIt(),
    ),
  );
}
