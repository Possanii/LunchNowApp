import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/auth/home/auth_home_page.dart';
import 'package:lunch_now/app/modules/auth/login/login_module.dart';
import 'package:lunch_now/app/modules/auth/register/register_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, __) => AuthHomePage(
              authStore: Modular.get(),
            )),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/register', module: RegisterModule())
  ];
}
