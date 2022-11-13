import 'package:lunch_now/app/entities/address_entity.dart';
import 'package:lunch_now/app/models/place_model.dart';

abstract class AddressService {
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern);
  Future<List<AddressEntity>> getAddress();
  Future<AddressEntity> saveAddress(PlaceModel placeModel, String additional);
  Future<void> deleteAll();
}
