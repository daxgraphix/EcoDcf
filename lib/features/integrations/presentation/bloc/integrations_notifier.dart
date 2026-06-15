import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/integrations/domain/entities/integration.dart';

final integrationsProvider = StateNotifierProvider<IntegrationsNotifier, IntegrationsState>((ref) {
  return IntegrationsNotifier();
});

abstract class IntegrationsState {}

class IntegrationsInitial extends IntegrationsState {}

class IntegrationsLoading extends IntegrationsState {}

class IntegrationsLoaded extends IntegrationsState {
  final List<Integration> integrations;

  IntegrationsLoaded(this.integrations);
}

class IntegrationsError extends IntegrationsState {
  final String message;

  IntegrationsError(this.message);
}

class IntegrationsNotifier extends StateNotifier<IntegrationsState> {
  IntegrationsNotifier() : super(IntegrationsInitial());
}
