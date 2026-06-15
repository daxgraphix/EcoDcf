import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/auth/domain/entities/user.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;

  AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthInitial());
}
