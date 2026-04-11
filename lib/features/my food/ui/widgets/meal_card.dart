import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal, required this.onTap});
  final MealEntity meal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                meal.imageUrl,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 80.w,
                  height: 80.h,
                  color: AppColors.input,
                  child: const Icon(
                    Icons.restaurant,
                    color: AppColors.textHint,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: AppColors.primary,
                        size: 18,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        meal.rating?.toStringAsFixed(1) ?? 'N/A',
                        style: context.font13TextHintRegular?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    meal.name,
                    style: context.font16TextDarkRegular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    meal.description,
                    style: context.font13TextHintRegular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${meal.price.toStringAsFixed(2)}',
                        style: context.font16WhiteSemiBold?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      InkWell(
                        onTap: onTap,
                        borderRadius: BorderRadius.circular(8.r),
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
