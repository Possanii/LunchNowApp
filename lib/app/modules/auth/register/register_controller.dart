import 'package:lunch_now/app/core/exceptions/user_exists_exception.dart';
import 'package:lunch_now/app/core/ui/widgets/loader.dart';
import 'package:lunch_now/app/core/ui/widgets/messages.dart';
import 'package:lunch_now/app/services/user/user_service.dart';
import 'package:mobx/mobx.dart';

import 'package:lunch_now/app/core/logger/app_logger.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;
  RegisterControllerBase({
    required UserService userService,
    required AppLogger log,
  })  : _userService = userService,
        _log = log;

  Future<void> register(
      {required String username,
      required String cpf,
      required String email,
      required String password}) async {
    try {
      Loader.show();
      await _userService.register(username, cpf, email, password);
      Messages.info(
          'Enviamos um e-mail de confirmação, por favor olhe sua caixa de e-mail');
      Loader.hide();
    } on UserExistsException {
      Loader.hide();
      Messages.alert("E-mail já utilizado, por favor escolha outro");
    } catch (e, s) {
      _log.error('Erro ao registrar o usuário', e, s);
      Loader.hide();
      Messages.alert("Erro ao registrar o usuário");
    }
  }
}
