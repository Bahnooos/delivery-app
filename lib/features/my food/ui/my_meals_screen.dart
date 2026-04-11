import 'package:delivery_app/core/di/dependency_injection.dart';
import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/features/my%20food/logic/meals_cubit/meals_cubit.dart';
import 'package:delivery_app/features/my%20food/logic/meals_cubit/meals_state.dart';
import 'package:delivery_app/features/my%20food/ui/widgets/meal_card.dart';
import 'package:delivery_app/features/my%20food/ui/widgets/meals_tab_bar.dart';
import 'package:delivery_app/features/notification/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMealsScreen extends StatelessWidget {
  const MyMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MealsCubit>()..emitMealsStates(),
      child: const _MyMealsView(),
    );
  }
}

class _MyMealsView extends StatelessWidget {
  const _MyMealsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(title: 'My Meals List'),
              SizedBox(height: 24.h),
              const MealsTabBar(),
              SizedBox(height: 16.h),
              Expanded(child: _buildMealsList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealsList() {
    return BlocBuilder<MealsCubit, MealsState>(
      builder: (context, state) {
        if (state is MealsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MealsError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, color: AppColors.error, size: 48),
                SizedBox(height: 12.h),
                Text(
                  state.failure.message ?? 'Something went wrong',
                  style: context.font14TextSecondaryRegular,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        if (state is MealsSuccess) {
          if (state.meals.isEmpty) {
            return Center(
              child: Text('No meals found', style: context.font14TextSecondaryRegular),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total ${state.meals.length.toString().padLeft(2, '0')} items',
                style: context.font14TextSecondaryRegular,
              ),
              SizedBox(height: 12.h),
              Expanded(
                child: ListView.builder(
                  itemCount: state.meals.length,
                  itemBuilder: (context, index) {
                    final meal = state.meals[index];
                    return MealCard(
                      meal: meal,
                      onTap: () => _navigateToDetail(context, meal),
                    );
                  },
                ),
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  void _navigateToDetail(BuildContext context, dynamic meal) {
    context.pushNamed(Routes.mealDetailScreen, argument: meal);
  }
}
