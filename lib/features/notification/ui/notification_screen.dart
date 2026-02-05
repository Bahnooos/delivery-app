import 'package:delivery_app/features/notification/ui/widgets/notification_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../logic/notification_cubit.dart';
import 'widgets/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotificationCubit>()..getNotifications(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: 24.verticalSpace),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                sliver: SliverToBoxAdapter(
                  child: CustomAppBar(title: 'Notification'),
                ),
              ),
              SliverToBoxAdapter(child: 32.verticalSpace),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                sliver: const NotificationList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
