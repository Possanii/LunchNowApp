// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lunch_now/app/entities/address_entity.dart';
import 'package:lunch_now/app/models/supplier_nearbyme_model.dart';
import 'package:lunch_now/app/repositories/supplier/supplier_repository.dart';
import 'package:lunch_now/app/services/supplier/supplier_service.dart';

class SupplierServiceImpl extends SupplierService {
  final SupplierRepository _repository;
  SupplierServiceImpl({
    required SupplierRepository repository,
  }) : _repository = repository;
  @override
  Future<List<SupplierNearbyMeModel>> findNearByMe(AddressEntity address) =>
      _repository.findNearByMe(address);
}
