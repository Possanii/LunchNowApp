import 'package:lunch_now/app/core/life_cycle/controller_life_cycle.dart';
import 'package:lunch_now/app/core/ui/widgets/loader.dart';
import 'package:lunch_now/app/entities/address_entity.dart';
import 'package:lunch_now/app/services/address/address_service.dart';
import 'package:mobx/mobx.dart';
part 'address_controller.g.dart';

class AddressController = AddressControllerBase with _$AddressController;

abstract class AddressControllerBase with Store, ControllerLifeCycle {
  final AddressService _addressService;

  @readonly
  List<AddressEntity> _addresses = [];

  AddressControllerBase({
    required AddressService addressService,
  }) : _addressService = addressService;

  @override
  void onReady() {
    getAddresses();
  }

  @action
  Future<void> getAddresses() async {
    Loader.show();
    _addresses = await _addressService.getAddress();
    Loader.hide();
  }
}
