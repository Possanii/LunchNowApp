import 'package:lunch_now/app/core/exceptions/failure.dart';
import 'package:lunch_now/app/core/logger/app_logger.dart';
import 'package:lunch_now/app/core/rest_client/rest_client.dart';
import 'package:lunch_now/app/core/rest_client/rest_client_exception.dart';
import 'package:lunch_now/app/models/meal_model.dart';
import 'package:lunch_now/app/repositories/meal/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final RestClient _restClient;
  final AppLogger _log;
  MealRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<List<MealModel>> getMealByIdr(args) async {
    try {
      final result = await _restClient.unAuth().get(
            '/meal/list/$args',
          );
      return result.data
          ?.map<MealModel>((mealResponse) => MealModel.fromMap(mealResponse))
          .toList();
    } on RestClientException catch (e, s) {
      const message = "Erro ao buscar refeições do restaurante selecionado";
      _log.error(message, e, s);
      throw Failure(message: message);
    }
  }
}
