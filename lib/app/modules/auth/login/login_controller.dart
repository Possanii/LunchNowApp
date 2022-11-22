import 'package:lunch_now/app/core/exceptions/failure.dart';
import 'package:lunch_now/app/core/exceptions/user_not_exists_exception.dart';
import 'package:lunch_now/app/core/ui/widgets/messages.dart';
import 'package:mobx/mobx.dart';

import 'package:lunch_now/app/core/logger/app_logger.dart';
import 'package:lunch_now/app/core/ui/widgets/loader.dart';
import 'package:lunch_now/app/services/user/user_service.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;

  LoginControllerBase({
    required UserService userService,
    required AppLogger log,
  })  : _userService = userService,
        _log = log;

  Future<void> login(String login, String password) async {
    try {
      Loader.show();
      await _userService.login(login, password);
      Loader.hide();
    } on Failure catch (e) {
      final errorMessage = e.message ?? 'Erro ao realizar login';
      _log.error(errorMessage);
      Loader.hide();
      Messages.alert(errorMessage);
    } on UserNotExistsException {
      _log.error('Usuário não encontrado');
      Loader.hide();
      Messages.alert('Usuário não encontrado');
    }
  }
}
