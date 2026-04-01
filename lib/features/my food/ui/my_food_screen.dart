import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/features/my%20food/ui/widgets/meals_tab_bar.dart';
import 'package:delivery_app/features/notification/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFoodScreen extends StatelessWidget {
  const MyFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 12.0.w, right: 12.0.w, top: 24.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: 'My Food List'),
                24.verticalSpace,
                MealsTabBar(),
                16.verticalSpace,
                Text(
                  'Total 03 items',
                  style: context.font14TextSecondaryRegular,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
