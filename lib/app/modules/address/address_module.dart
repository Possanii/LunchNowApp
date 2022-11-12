import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/address/address_details/address_details_module.dart';
import 'package:lunch_now/app/modules/address/address_page.dart';
import 'package:lunch_now/app/modules/address/widget/address_search_widget/address_search_controller.dart';

class AddressModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AddressSearchController(addressService: i()))
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const AddressPage()),
        ModuleRoute('/detail', module: AddressDetailsModule()),
      ];
}
