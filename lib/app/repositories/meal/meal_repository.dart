import 'package:lunch_now/app/models/meal_model.dart';

abstract class MealRepository {
  Future<List<MealModel>> getMealByIdr(args);
}
