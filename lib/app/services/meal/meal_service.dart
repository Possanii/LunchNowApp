import 'package:lunch_now/app/models/meal_model.dart';

abstract class MealService {
  Future<List<MealModel>> getMealByIdr(args);
}
