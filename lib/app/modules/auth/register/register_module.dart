import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/auth/register/register_page.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const RegisterPage(),
    )
  ];
}
