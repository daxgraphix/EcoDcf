import 'package:ecodcf/features/sustainability/domain/entities/dscore.dart';
import 'package:ecodcf/features/sustainability/domain/repositories/sustainability_repository.dart';

abstract class GetDScoreUseCase {
  Future<DScore> call();
}

class GetDScoreUseCaseImpl implements GetDScoreUseCase {
  final SustainabilityRepository _repository;

  GetDScoreUseCaseImpl(this._repository);

  @override
  Future<DScore> call() => _repository.getCurrentDScore();
}
