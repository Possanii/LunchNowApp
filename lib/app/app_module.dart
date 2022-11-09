import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/address/address_module.dart';
import 'package:lunch_now/app/modules/address/address_page.dart';
import 'package:lunch_now/app/modules/auth/auth_module.dart';
import 'package:lunch_now/app/modules/core/core_module.dart';
import 'package:lunch_now/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/address', module: AddressModule()),
      ];
}
