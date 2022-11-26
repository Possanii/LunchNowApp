import 'package:lunch_now/app/entities/address_entity.dart';
import 'package:lunch_now/app/models/supplier_nearbyme_model.dart';

abstract class SupplierRepository {
  Future<List<SupplierNearbyMeModel>> findNearByMe(AddressEntity address);
}
