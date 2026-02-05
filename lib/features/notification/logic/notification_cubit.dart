import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/notification_repo.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo _notificationRepo;

  NotificationCubit(this._notificationRepo) : super(NotificationInitial());

  Future<void> getNotifications() async {
    emit(NotificationLoading());
    try {
      final notifications = await _notificationRepo.getNotifications();
      if (notifications.isEmpty) {
        emit(NotificationEmpty());
      } else {
        emit(NotificationSuccess(notifications));
      }
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
