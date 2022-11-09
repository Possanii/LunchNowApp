import 'package:lunch_now/app/models/meal_model.dart';

abstract class MealList {
  Future<List<MealModel>> findAllMeals();
}
