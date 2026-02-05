import 'package:get_it/get_it.dart';

import '../../features/notification/data/repos/notification_repo.dart';
import '../../features/notification/logic/notification_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & API Service
  // getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
  // getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));

  // Features - Notification
  getIt.registerLazySingleton<NotificationRepo>(() => NotificationRepo());
  getIt.registerFactory<NotificationCubit>(() => NotificationCubit(getIt()));
}
