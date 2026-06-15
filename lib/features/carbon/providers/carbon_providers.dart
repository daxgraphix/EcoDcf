import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';
import 'package:ecodcf/features/carbon/data/repositories/carbon_repository_impl.dart';
import 'package:ecodcf/features/carbon/domain/repositories/carbon_repository.dart';

part 'carbon_providers.g.dart';

@riverpod
Future<CarbonRepository> carbonRepository(CarbonRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return CarbonRepositoryImpl(isar);
}

