import 'package:delivery_app/core/networking/api_constant.dart';
import 'package:delivery_app/features/my%20food/data/models/add_to_cart_request_body.dart';
import 'package:delivery_app/features/my%20food/data/models/meal.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'meals_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class MealsApiService {
  factory MealsApiService(Dio dio) = _MealsApiService;

  @GET(ApiConstant.mealsEndpoint)
  Future<List<Meal>> getMeals();

  @GET('${ApiConstant.mealsEndpoint}/{id}')
  Future<Meal> getMealById(@Path('id') int id);

  @POST(ApiConstant.addToCartEndpoint)
  Future<void> addToCart(@Body() AddToCartRequestBody requestBody);
}
