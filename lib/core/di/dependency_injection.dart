import 'package:delivery_app/core/networking/api_service.dart';
import 'package:delivery_app/core/networking/auth/auth_event_bus.dart';
import 'package:delivery_app/core/networking/auth/token_storage.dart';
import 'package:delivery_app/core/networking/dio_factory.dart';
import 'package:delivery_app/features/auth/data/apis/auth_api_service.dart';
import 'package:delivery_app/features/auth/data/repos/auth_repo.dart';
import 'package:delivery_app/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:delivery_app/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:delivery_app/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:delivery_app/features/auth/logic/verify_cubit/verification_cubit.dart';
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
    () => VerificationCubit(authRepo: getIt(),tokenStorage: getIt()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt(), getIt()));
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(authEventBus: getIt(), tokenStorage: getIt()),
  );
}
