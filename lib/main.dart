
import 'package:delivery_app/core/di/dependency_injection.dart';
import 'package:delivery_app/core/routing/app_router.dart';
import 'package:delivery_app/delivery_app.dart';
import 'package:delivery_app/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>getIt<AuthCubit>()),
    ],
    child: DeliveryApp(appRouter: AppRouter())));
}