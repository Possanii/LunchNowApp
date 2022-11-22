import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/home/home_controller.dart';
import 'package:lunch_now/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeController(addressService: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const HomePage())
  ];
}
