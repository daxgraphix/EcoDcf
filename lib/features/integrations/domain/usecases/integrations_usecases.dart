import 'package:ecodcf/features/integrations/domain/entities/integration.dart';
import 'package:ecodcf/features/integrations/domain/repositories/integrations_repository.dart';

abstract class GetIntegrationsUseCase {
  Future<List<Integration>> call();
}

class GetIntegrationsUseCaseImpl implements GetIntegrationsUseCase {
  final IntegrationsRepository _repository;

  GetIntegrationsUseCaseImpl(this._repository);

  @override
  Future<List<Integration>> call() => _repository.getAllIntegrations();
}
