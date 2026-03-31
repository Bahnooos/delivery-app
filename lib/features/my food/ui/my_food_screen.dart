import 'package:delivery_app/features/notification/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyFoodScreen extends StatelessWidget {
  const MyFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            CustomAppBar(title: 'My Food List'),
          ]),
        ),
      ),
    );
  }
}
