import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/sustainability/domain/entities/dscore.dart';

final sustainabilityProvider = StateNotifierProvider<SustainabilityNotifier, SustainabilityState>((ref) {
  return SustainabilityNotifier();
});

abstract class SustainabilityState {}

class SustainabilityInitial extends SustainabilityState {}

class SustainabilityLoading extends SustainabilityState {}

class SustainabilityLoaded extends SustainabilityState {
  final DScore dscore;

  SustainabilityLoaded(this.dscore);
}

class SustainabilityError extends SustainabilityState {
  final String message;

  SustainabilityError(this.message);
}

class SustainabilityNotifier extends StateNotifier<SustainabilityState> {
  SustainabilityNotifier() : super(SustainabilityInitial());
}
