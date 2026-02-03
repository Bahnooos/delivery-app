import 'package:delivery_app/features/notification/ui/widgets/inbox_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(28.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: CustomAppBar(title: 'Notification')),
              24.verticalSpace,
              InboxSection(),
            ],
          ),
        ),
      ),
    );
  }
}
