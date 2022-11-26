// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lunch_now/app/models/meal_model.dart';
import 'package:lunch_now/app/repositories/meal/meal_repository.dart';
import 'package:lunch_now/app/services/meal/meal_service.dart';

class MealServiceImpl implements MealService {
  final MealRepository _mealRepository;
  MealServiceImpl({
    required MealRepository mealRepository,
  }) : _mealRepository = mealRepository;
  @override
  Future<List<MealModel>> getMealByIdr(args) =>
      _mealRepository.getMealByIdr(args);
}
