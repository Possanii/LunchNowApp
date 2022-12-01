import 'package:lunch_now/app/core/life_cycle/controller_life_cycle.dart';
import 'package:lunch_now/app/core/ui/widgets/loader.dart';
import 'package:lunch_now/app/core/ui/widgets/messages.dart';
import 'package:lunch_now/app/models/meal_model.dart';
import 'package:lunch_now/app/services/meal/meal_service.dart';
import 'package:mobx/mobx.dart';
part 'meal_controller.g.dart';

class MealController = MealControllerBase with _$MealController;

abstract class MealControllerBase with Store, ControllerLifeCycle {
  final MealService _mealService;

  MealControllerBase({required MealService mealService})
      : _mealService = mealService;

  @readonly
  MealModel? _mealModel;

  @readonly
  var _mealByRestaurant = <MealModel>[];

  @override
  Future<void> onReady() async {
    Loader.show();
    Loader.hide();
  }

  @action
  Future<void> getMealByIdr(args) async {
    if (args != null) {
      final meals = await _mealService.getMealByIdr(args);
      _mealByRestaurant = [...meals];
    } else {
      Messages.alert('Nenhum produto encontrado nesse estabelecimentos');
    }
  }
}
