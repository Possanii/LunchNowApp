// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lunch_now/app/core/exceptions/failure.dart';
import 'package:lunch_now/app/core/logger/app_logger.dart';
import 'package:lunch_now/app/core/rest_client/rest_client.dart';
import 'package:lunch_now/app/core/rest_client/rest_client_exception.dart';
import 'package:lunch_now/app/models/supplier_nearbyme_model.dart';
import 'package:lunch_now/app/entities/address_entity.dart';
import 'package:lunch_now/app/repositories/supplier/supplier_repository.dart';

class SupplierRepositoryImpl extends SupplierRepository {
  final RestClient _restClient;
  final AppLogger _log;
  SupplierRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<List<SupplierNearbyMeModel>> findNearByMe(
      AddressEntity address) async {
    try {
      final result = await _restClient.unAuth().post(
        '/restaurant/restaurantsbydistance',
        data: {
          'x': address.lat.toDouble(),
          'y': address.lng.toDouble(),
        },
      );
      return result.data
          ?.map<SupplierNearbyMeModel>((supplierResponse) =>
              SupplierNearbyMeModel.fromMap(supplierResponse))
          .toList();
    } on RestClientException catch (e, s) {
      const message = "Erro ao buscar fornecedores perto de mim";
      _log.error(message, e, s);
      throw Failure(message: message);
    }
  }
}
