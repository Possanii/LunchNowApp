import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/core/exceptions/failure.dart';
import 'package:lunch_now/app/core/exceptions/user_exists_exception.dart';
import 'package:lunch_now/app/core/exceptions/user_not_exists_exception.dart';
import 'package:lunch_now/app/core/helpers/constants.dart';
import 'package:lunch_now/app/core/local_storage/local_storage.dart';
import 'package:lunch_now/app/core/logger/app_logger.dart';
import 'package:lunch_now/app/core/ui/widgets/messages.dart';
import 'package:lunch_now/app/repositories/user/user_repository.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;
  final LocalStorage _localStorage;
  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger log,
    required LocalStorage localStorage,
  })  : _userRepository = userRepository,
        _log = log,
        _localStorage = localStorage;

  @override
  Future<void> register(
      String username, String cpf, String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final userMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userMethods.isNotEmpty) {
        throw UserExistsException();
      }

      await _userRepository.register(username, cpf, email, password);
      final userRegisterCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userRegisterCredential.user?.sendEmailVerification();
    } on FirebaseException catch (e, s) {
      _log.error('Erro ao criar usuário no firebase', e, s);
      throw Failure(message: 'Erro ao criar usuário');
    }
  }

  @override
  Future<void> login(String login, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final loginMethod = await firebaseAuth.fetchSignInMethodsForEmail(login);

      if (loginMethod.isEmpty) {
        throw UserNotExistsException();
      }

      if (loginMethod.contains('password')) {
        final userCredential = await firebaseAuth.signInWithEmailAndPassword(
            email: login, password: password);
        if (!(userCredential.user?.emailVerified ?? false)) {
          userCredential.user?.sendEmailVerification();
          throw Failure(
              message:
                  'E-mail não confirmado, por favor verifique sua caixa de spam');
        }
        final accessToken = await _userRepository.login(login, password);
        await _saveAccessToken(accessToken);
        Messages.info('Login com sucesso');
        Modular.to.pushNamed('/home/');
      } else {
        throw Failure(
            message:
                'Login não pode ser feito por e-mail e senha, por favor utilize outro método');
      }
    } on FirebaseAuthException catch (e, s) {
      _log.error('Usuário ou senha inválidos FirebaseAuth [${e.code}] / [$s]');
      throw Failure(message: 'Usuário ou senha inválidos');
    }
  }

  Future<void> _saveAccessToken(String accessToken) => _localStorage
      .write<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);
}
