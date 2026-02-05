import 'package:delivery_app/features/notification/ui/widgets/notification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';
import '../../logic/notification_cubit.dart';
import '../../logic/notification_state.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return switch (state) {
          NotificationLoading() => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          NotificationSuccess(notifications: final notifications) =>
            SliverList.separated(
              itemBuilder: (context, index) =>
                  NotificationItemWidget(notification: notifications[index]),
              separatorBuilder: (context, index) =>
                  Divider(color: AppColors.gray, thickness: 0.5, height: 30.h),
              itemCount: notifications.length,
            ),
          NotificationEmpty() => const SliverToBoxAdapter(
            child: Center(child: Text('No notifications yet')),
          ),
          NotificationError(message: final error) => SliverToBoxAdapter(
            child: Center(child: Text(error)),
          ),
          _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
        };
      },
    );
  }
}
