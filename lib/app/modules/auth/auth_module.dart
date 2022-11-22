import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/auth/home/auth_home_page.dart';
import 'package:lunch_now/app/modules/auth/login/login_module.dart';
import 'package:lunch_now/app/modules/auth/register/register_module.dart';
import 'package:lunch_now/app/modules/core/auth/auth_store.dart';
import 'package:lunch_now/app/repositories/user/user_repository.dart';
import 'package:lunch_now/app/repositories/user/user_repository_impl.dart';
import 'package:lunch_now/app/services/user/user_service.dart';
import 'package:lunch_now/app/services/user/user_service_impl.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<UserRepository>((i) =>
        UserRepositoryImpl(log: i(), restClient: i(), localStorage: i())),
    Bind.lazySingleton<UserService>((i) =>
        UserServiceImpl(log: i(), userRepository: i(), localStorage: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, __) => AuthHomePage(
              authStore: Modular.get<AuthStore>(),
            )),
    ModuleRoute('/login/', module: LoginModule()),
    ModuleRoute('/register/', module: RegisterModule())
  ];
}
