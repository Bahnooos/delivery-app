import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';
import 'package:delivery_app/features/my%20food/logic/meal_detail_cubit/meal_detail_cubit.dart';
import 'package:delivery_app/features/my%20food/logic/meal_detail_cubit/meal_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MealDetailView();
  }
}

class _MealDetailView extends StatelessWidget {
  const _MealDetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MealDetailCubit, MealDetailState>(
          listener: (ctx, state) {
            if (state is AddToCartSuccess) {
              ScaffoldMessenger.of(ctx).showSnackBar(
                const SnackBar(content: Text('Added to cart successfully')),
              );
            }
            if (state is AddToCartError) {
              ScaffoldMessenger.of(ctx).showSnackBar(
                SnackBar(
                  content: Text(
                    state.failure.message ?? 'Failed to add to cart',
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is MealDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final cubit = context.read<MealDetailCubit>();
            final displayMeal = state is MealDetailSuccess
                ? state.meal
                : cubit.meal;
            if (displayMeal == null) {
              return const Center(child: Text('Meal not found'));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, displayMeal),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRatingBadge(context, displayMeal),
                        SizedBox(height: 12.h),
                        Text(
                          displayMeal.name,
                          style: context.font28TextPrimaryBold,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          displayMeal.description,
                          style: context.font14TextSecondaryRegular,
                        ),
                        SizedBox(height: 24.h),
                        BlocBuilder<MealDetailCubit, MealDetailState>(
                          builder: (ctx, st) {
                            final q = ctx.read<MealDetailCubit>().quantity;
                            return Row(
                              children: [
                                Text(
                                  'Total Price',
                                  style: context.font14TextSecondaryRegular,
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  '\$${(displayMeal.price * q).toStringAsFixed(2)}',
                                  style: context.font22TextPrimarySemiBold
                                      ?.copyWith(color: AppColors.primary),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
                _buildBottomBar(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, MealEntity meal) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r),
          ),
          child: Image.network(
            meal.imageUrl,
            width: double.infinity,
            height: 260.h,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: double.infinity,
              height: 260.h,
              color: AppColors.input,
              child: const Icon(
                Icons.restaurant,
                size: 64,
                color: AppColors.textHint,
              ),
            ),
          ),
        ),
        Positioned(
          top: 12.h,
          left: 12.w,
          child: InkWell(
            onTap: () => context.pop(),
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.textPrimary,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingBadge(BuildContext context, MealEntity meal) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, color: AppColors.primary, size: 18),
          SizedBox(width: 4.w),
          Text(
            meal.rating?.toStringAsFixed(1) ?? 'N/A',
            style: context.font14TextSecondaryRegular?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              'very good',
              style: context.font11TextHintMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final cubit = context.read<MealDetailCubit>();

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.input,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                _buildQuantityButton(
                  icon: Icons.remove,
                  onTap: () => cubit.decrementQuantity(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: BlocBuilder<MealDetailCubit, MealDetailState>(
                    builder: (ctx, state) {
                      return Text(
                        ctx.read<MealDetailCubit>().quantity.toString(),
                        style: context.font18TextMediumSemiBold,
                      );
                    },
                  ),
                ),
                _buildQuantityButton(
                  icon: Icons.add,
                  onTap: () => cubit.incrementQuantity(),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () => cubit.addToCart(),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              child: BlocBuilder<MealDetailCubit, MealDetailState>(
                builder: (ctx, state) {
                  if (state is AddToCartLoading) {
                    return const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    );
                  }
                  return Text(
                    'Add to Cart',
                    style: context.font16WhiteSemiBold,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(8.w),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
      ),
    );
  }
}
