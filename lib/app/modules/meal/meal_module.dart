import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/meal/meal_page.dart';

class MealModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const MealPage())
  ];
}
