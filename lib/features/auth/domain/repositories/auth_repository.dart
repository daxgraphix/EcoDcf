import 'package:ecodcf/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password, String name);
  Future<void> logout();
  Future<User?> getcurrentUser();
  Future<void> saveUser(User user);
  Future<void> clearUser();
}
