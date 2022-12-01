import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/core/life_cycle/controller_life_cycle.dart';
import 'package:lunch_now/app/core/ui/widgets/loader.dart';
import 'package:lunch_now/app/core/ui/widgets/messages.dart';
import 'package:lunch_now/app/entities/address_entity.dart';
import 'package:lunch_now/app/models/supplier_category_model.dart';
import 'package:lunch_now/app/models/supplier_nearbyme_model.dart';
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

  @readonly
  var _listSupplierByAddress = <SupplierNearbyMeModel>[];

  var _listSupplierByAddressCache = <SupplierNearbyMeModel>[];

  late ReactionDisposer findSuppliersReactionDisposer;

  var _nameSearchText = '';

  @readonly
  SupplierCategoryModel? _supplierCategoryFilterSelected;

  @override
  Future<void> onReady() async {
    try {
      Loader.show();
      await _getAddressSelected();
      await _getCategories();
    } finally {
      Loader.hide();
    }
  }

  @override
  void onInit([Map<String, dynamic>? params]) {
    findSuppliersReactionDisposer = reaction((_) => _addressEntity, (address) {
      findSupplierByAddress();
    });
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
      var categories = ["Pizza", "Hamburguer", "Churrasco", "Bebidas", "Frutas"]
          .map((e) => SupplierCategoryModel(name: e));
      _listCategories = [...categories];
    } catch (e) {
      Messages.alert('Erro ao buscar categorias');
      throw Exception();
    }
  }

  void changeTabSupplier(SupplierPageType supplierPageType) {
    _supplierPageTypeSelected = supplierPageType;
  }

  @action
  Future<void> findSupplierByAddress() async {
    if (_addressEntity != null) {
      final suppliers = await _supplierService.findNearByMe(_addressEntity!);
      _listSupplierByAddress = [...suppliers];
      _listSupplierByAddressCache = [...suppliers];
      filterSupplier();
    } else {
      Messages.alert(
          'Para realizar a busca você precisa selecione um endereço');
    }
  }

  @action
  void filterSuppliersCategory(SupplierCategoryModel category) {
    if (_supplierCategoryFilterSelected == category) {
      _supplierCategoryFilterSelected = null;
    } else {
      _supplierCategoryFilterSelected = category;
    }
    filterSupplier();
  }

  void filterSupplierByName(String name) {
    _nameSearchText = name;
    filterSupplier();
  }

  @action
  void filterSupplier() {
    var suppliers = [..._listSupplierByAddressCache];
    if (_supplierCategoryFilterSelected != null) {
      suppliers = suppliers
          .where((supplier) =>
              supplier.type == _supplierCategoryFilterSelected?.name)
          .toList();
    }
    if (_nameSearchText.isNotEmpty) {
      suppliers = suppliers
          .where((supplier) => supplier.name
              .toLowerCase()
              .contains(_nameSearchText.toLowerCase()))
          .toList();
    }
    _listSupplierByAddress = [...suppliers];
  }
}
