import 'package:delivery_app/core/theme/app_images.dart';

class OnbordingPageModel {
  final String? image;
  final String? title;

  final String description;

 const OnbordingPageModel({required this.image, required this.description, this.title});
}

List<OnbordingPageModel> onbordingPages = [
  OnbordingPageModel(image: AppImages.onbording_1,title: 'All your favorites', description: 'Get all your loved foods in one once place,\nyou just place the orer we do the rest'),
  OnbordingPageModel(image: AppImages.onbording_2, title: 'All your favorites', description: 'Get all your loved foods in one once place,\nyou just place the orer we do the rest'),
  OnbordingPageModel(image: AppImages.onbording_3, title: 'Order from choosen chef', description: 'Get all your loved foods in one once place,\nyou just place the orer we do the rest'),
  OnbordingPageModel(image: AppImages.onbording_4, title: 'Free delivery offers', description: 'Get all your loved foods in one once place,\nyou just place the orer we do the rest'),
];
