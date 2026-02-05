import '../models/notification_model.dart';

class NotificationRepo {
  Future<List<NotificationModel>> getNotifications() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      NotificationModel(
        id: 1,
        title: 'Order Arrived',
        body: 'Your order has been arrived at your destination.',
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        isRead: false,
      ),
      NotificationModel(
        id: 2,
        title: 'Order Success',
        body: 'Your order has been successfully placed.',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        isRead: true,
      ),
      NotificationModel(
        id: 3,
        title: 'Payment Confirmed',
        body: 'Your payment was successful.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
      ),
    ];
  }
}
