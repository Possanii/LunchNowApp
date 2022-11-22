import 'package:lunch_now/app/core/exceptions/failure.dart';
import 'package:lunch_now/app/core/exceptions/user_exists_exception.dart';
import 'package:lunch_now/app/core/logger/app_logger.dart';
import 'package:lunch_now/app/core/rest_client/rest_client.dart';
import 'package:lunch_now/app/core/rest_client/rest_client_exception.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;
  final AppLogger _log;
  UserRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<void> register(
      String username, String cpf, String email, String password) async {
    try {
      await _restClient.unAuth().post('/user/save', data: {
        'name': username,
        'cpf': cpf,
        'email': email,
        'password': password,
      });
    } on RestClientException catch (e, s) {
      if (e.statusCode == 400 &&
          e.response.data['message'].contains('Usuário já cadastrado')) {
        _log.error(e.error, e, s);
        throw UserExistsException();
      }
      _log.error("Erro ao cadastrar usuário", e, s);
      throw Failure(message: "Erro ao registar usuário");
    }
  }

  @override
  Future<String> login(String email, String password) async {
    try {
      final result = await _restClient.unAuth().post(
        '/user/authuser',
        data: {'email': email, 'password': password},
      );
      return result.data['idu'];
    } on RestClientException catch (e, s) {
      if (e.statusCode == 403) {
        throw Failure(
            message: 'Usuário inconsistente, entre em contato com o suporte');
      }
      _log.error("Erro ao realizar login", e, s);
      throw Failure(
          message: 'Erro ao realizar login, tente novamente mais tarde');
    }
  }
}
