import 'package:flutter_config/flutter_config.dart';
import 'package:google_place/google_place.dart';
import 'package:lunch_now/app/core/database/sqlite_connection_factory.dart';
import 'package:lunch_now/app/entities/address_entity.dart';
import 'package:lunch_now/app/models/place_model.dart';

import './address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  SqliteConnectionFactory _sqliteConnectionFactory;

  AddressRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<List<PlaceModel>> findAddressByGooglePlaces(
      String addressPattern) async {
    final googleApiKey = FlutterConfig.get('google_api_key');

    if (googleApiKey == null) {
      throw Exception('Google API Key Not Found');
    }

    final places = GooglePlace(googleApiKey);
    final addressResult = await places.search.getTextSearch(addressPattern);
    final candidates = addressResult?.results;

    if (candidates != null) {
      return candidates.map<PlaceModel>((searchResult) {
        final location = searchResult.geometry?.location;
        final address = searchResult.formattedAddress;

        return PlaceModel(
          address: address ?? '',
          lat: location?.lat ?? 0,
          lng: location?.lng ?? 0,
        );
      }).toList();
    }
    return <PlaceModel>[];
  }

  @override
  Future<void> deleteAll() async {
    final sqliteConn = await _sqliteConnectionFactory.openConnection();
    await sqliteConn.delete('address');

    throw UnimplementedError();
  }

  @override
  Future<List<AddressEntity>> getAddress() async {
    final sqliteConn = await _sqliteConnectionFactory.openConnection();
    final results = await sqliteConn.rawQuery('select * from address');
    return results.map<AddressEntity>((a) => AddressEntity.fromMap(a)).toList();
  }

  @override
  Future<int> saveAddress(AddressEntity entity) async {
    final sqliteConn = await _sqliteConnectionFactory.openConnection();
    return await sqliteConn.rawInsert('Insert into address values(?,?,?,?,?)', [
      null,
      entity.address,
      entity.lat,
      entity.lng,
      entity.additional,
    ]);
  }
}
