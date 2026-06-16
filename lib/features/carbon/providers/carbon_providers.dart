import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';
import 'package:ecodcf/features/carbon/data/repositories/carbon_repository_impl.dart';
import 'package:ecodcf/features/carbon/domain/repositories/carbon_repository.dart';
import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';

part 'carbon_providers.g.dart';

@riverpod
Future<CarbonRepository> carbonRepository(CarbonRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return CarbonRepositoryImpl(isar);
}

@riverpod
Stream<List<CarbonRecord>> carbonRecordsStream(CarbonRecordsStreamRef ref) async* {
  final repo = await ref.watch(carbonRepositoryProvider.future);
  yield* repo.watchAllRecords();
}

@riverpod
Future<List<CarbonRecord>> recentRecords(RecentRecordsRef ref) async {
  final repo = await ref.watch(carbonRepositoryProvider.future);
  final all = await repo.getAllRecords();
  return all.take(10).toList();
}

