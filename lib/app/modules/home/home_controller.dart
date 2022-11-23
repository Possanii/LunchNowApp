import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/core/life_cycle/controller_life_cycle.dart';
import 'package:lunch_now/app/core/ui/widgets/loader.dart';
import 'package:lunch_now/app/core/ui/widgets/messages.dart';
import 'package:lunch_now/app/entities/address_entity.dart';
import 'package:lunch_now/app/services/address/address_service.dart';
import 'package:lunch_now/app/services/supplier/supplier_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

enum SupplierPageType { list, grid }

// ignore: library_private_types_in_public_api
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store, ControllerLifeCycle {
  final AddressService _addressService;
  final SupplierService _supplierService;

  _HomeControllerBase(
      {required AddressService addressService,
      required SupplierService supplierService})
      : _addressService = addressService,
        _supplierService = supplierService;

  @readonly
  AddressEntity? _addressEntity;

  @readonly
  var _listCategories = [];

  @readonly
  var _supplierPageTypeSelected = SupplierPageType.list;

  @override
  Future<void> onReady() async {
    try {
      Loader.show();
      await _getAddressSelected();
      await _getCategories();
      if (_addressEntity != null) {
        await _supplierService.findNearByMe(_addressEntity!);
      }
      Loader.hide();
    } finally {
      Loader.hide();
    }
  }

  @action
  Future<void> _getAddressSelected() async {
    _addressEntity ??= await _addressService.getAddressSelected();

    if (_addressEntity == null) {
      await goToAddressPage();
    }
  }

  @action
  Future<void> goToAddressPage() async {
    final address = await Modular.to.pushNamed<AddressEntity>('/address/');
    if (address != null) {
      _addressEntity = address;
    }
  }

  @action
  Future<void> _getCategories() async {
    try {
      const categories = ['Pizza', 'Lanche', 'Churrasco', 'Drinks', 'Frutas'];
      _listCategories = [...categories];
    } catch (e) {
      Messages.alert('Erro ao buscar categorias');
      throw Exception();
    }
  }

  void changeTabSupplier(SupplierPageType supplierPageType) {
    _supplierPageTypeSelected = supplierPageType;
  }
}
