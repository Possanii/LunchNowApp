abstract class UserRepository {
  Future<void> register(
      String username, String cpf, String email, String password);
  Future<String> login(String email, String password);
}
