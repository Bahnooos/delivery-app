import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../data/models/notification_model.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          margin: EdgeInsets.only(top: 4.h, right: 12.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: notification.isRead ? Colors.transparent : Colors.orange,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${notification.title} ',
                      style: context.font16TextDarkRegular?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: notification.body,
                      style: context.font14TextSecondaryRegular?.copyWith(
                        color: const Color(0xff575757),
                      ),
                    ),
                  ],
                ),
              ),
              8.verticalSpace,
              Text(
                _formatDate(notification.createdAt),
                style: context.font14TextSecondaryRegular?.copyWith(
                  fontSize: 10.sp,
                  color: Color(0xffA0A5BA),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    // Simple formatter, can be replaced with intl package if needed
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
