import 'package:lunch_now/app/models/user_model.dart';

abstract class UserRepository {
  Future<void> register(
      String username, String cpf, String email, String password);
  Future<String> login(String email, String password);
  Future<UserModel> getUserLogged();
}
