import 'package:ecodcf/features/auth/domain/entities/user.dart';
import 'package:ecodcf/features/auth/domain/repositories/auth_repository.dart';

abstract class LoginUseCase {
  Future<User> call(String email, String password);
}

class LoginUseCaseImpl implements LoginUseCase {
  final AuthRepository _repository;

  LoginUseCaseImpl(this._repository);

  @override
  Future<User> call(String email, String password) {
    return _repository.login(email, password);
  }
}

abstract class RegisterUseCase {
  Future<User> call(String email, String password, String name);
}

class RegisterUseCaseImpl implements RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCaseImpl(this._repository);

  @override
  Future<User> call(String email, String password, String name) {
    return _repository.register(email, password, name);
  }
}

abstract class LogoutUseCase {
  Future<void> call();
}

class LogoutUseCaseImpl implements LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCaseImpl(this._repository);

  @override
  Future<void> call() {
    return _repository.logout();
  }
}

abstract class GetCurrentUserUseCase {
  Future<User?> call();
}

class GetCurrentUserUseCaseImpl implements GetCurrentUserUseCase {
  final AuthRepository _repository;

  GetCurrentUserUseCaseImpl(this._repository);

  @override
  Future<User?> call() {
    return _repository.getcurrentUser();
  }
}
