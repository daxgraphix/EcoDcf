import 'package:ecodcf/features/auth/domain/entities/user.dart';
import 'package:ecodcf/features/auth/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SharedPreferences prefs;

  AuthRepositoryImpl(this.prefs);

  @override
  Future<User> login(String email, String password) async {
    return User(
      id: '1',
      email: email,
      name: 'Test User',
      createdAt: DateTime.now(),
    );
  }

  @override
  Future<User> register(String email, String password, String name) async {
    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: name,
      createdAt: DateTime.now(),
    );
    await saveUser(user);
    return user;
  }

  @override
  Future<void> logout() async {
    await clearUser();
  }

  @override
  Future<User?> getcurrentUser() async {
    return null;
  }

  @override
  Future<void> saveUser(User user) async {}

  @override
  Future<void> clearUser() async {}
}
