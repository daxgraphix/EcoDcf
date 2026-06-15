import 'package:ecodcf/features/integrations/domain/entities/integration.dart';

abstract class IntegrationsRepository {
  Future<List<Integration>> getAllIntegrations();
  Future<void> connectIntegration(String id, String accountId);
  Future<void> disconnectIntegration(String id);
}
