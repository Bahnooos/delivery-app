import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/features/my%20food/logic/meals_cubit/meals_cubit.dart';
import 'package:delivery_app/features/my%20food/logic/meals_cubit/meals_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsTabBar extends StatelessWidget {
  const MealsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MealsCubit>();
    final meals = ['All', 'Breakfast', 'Lunch', 'Dinner'];

    return Row(
      children: List.generate(
        meals.length,
        (index) => Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: BlocBuilder<MealsCubit, MealsState>(
              builder: (context, state) {
                final selectedCategory = cubit.selectedCategory;
                final isSelected = meals[index] == selectedCategory;

                return InkWell(
                  onTap: () => cubit.changeCategory(meals[index]),
                  borderRadius: BorderRadius.circular(20.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.card,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      meals[index],
                      textAlign: TextAlign.center,
                      style: context.font14TextSecondaryRegular?.copyWith(
                        color: isSelected ? Colors.white : AppColors.textHint,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
