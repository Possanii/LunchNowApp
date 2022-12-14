import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/address/address_details/address_detail_controller.dart';
import 'package:lunch_now/app/modules/address/address_details/address_detail_page.dart';

class AddressDetailsModule extends Module {
  @override
  List<Bind<Object>> get binds =>
      [Bind.lazySingleton((i) => AddressDetailController(addressService: i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => AddressDetailPage(
            place: args.data,
          ),
        )
      ];
}
