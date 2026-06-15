import 'package:ecodcf/features/integrations/domain/entities/integration.dart';
import 'package:ecodcf/features/integrations/domain/repositories/integrations_repository.dart';

class IntegrationsRepositoryImpl implements IntegrationsRepository {
  @override
  Future<List<Integration>> getAllIntegrations() async => [];

  @override
  Future<void> connectIntegration(String id, String accountId) async {}

  @override
  Future<void> disconnectIntegration(String id) async {}
}
