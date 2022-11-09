import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/address/address_page.dart';

class AddressModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const AddressPage())
  ];
}
