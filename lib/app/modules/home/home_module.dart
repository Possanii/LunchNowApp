import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/home/home_controller.dart';
import 'package:lunch_now/app/modules/home/home_page.dart';
import 'package:lunch_now/app/modules/meal/meal_controller.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeController(
          addressService: i(),
          supplierService: i(),
        )),
    Bind.lazySingleton((i) => MealController(
          mealService: i(),
        ))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const HomePage())
  ];
}
