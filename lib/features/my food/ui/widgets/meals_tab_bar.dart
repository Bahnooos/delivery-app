import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsTabBar extends StatefulWidget {
  const MealsTabBar({super.key});

  @override
  State<MealsTabBar> createState() => _MealsTabBarState();
}

class _MealsTabBarState extends State<MealsTabBar> {
  final List<String> meals = ['All', 'Breakfast', 'Lunch', 'Dinner'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        meals.length,
        (index) => Expanded(
          child: Column(
            children: [
              InkWell(
                onTap: () => setState(() => selectedIndex = index),
                child: Text(meals[index], style: context.font16TextDarkRegular),
              ),
              4.verticalSpace,
              Container(
                height: 2,
                width: selectedIndex == 1 ? 100.w : 60.w,
                color: selectedIndex == index
                    ? Colors.orange
                    : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
