abstract class UserService {
  Future<void> register(
      String username, String cpf, String email, String password);
  Future<void> login(String login, String password);
}
