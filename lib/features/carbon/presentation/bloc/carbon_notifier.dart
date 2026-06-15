import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';
import 'package:ecodcf/features/carbon/data/repositories/carbon_repository_impl.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';

part 'carbon_notifier.g.dart';

@riverpod
class Carbon extends _$Carbon {
  late final CarbonRepositoryImpl _repository;

  @override
  Stream<List<CarbonRecord>> build() async* {
    final isar = await ref.watch(isarProvider.future);
    _repository = CarbonRepositoryImpl(isar);
    yield* _repository.watchAllRecords();
  }

  Future<void> addRecord(CarbonRecord record) async {
    await _repository.saveRecord(record);
  }

  Future<void> deleteRecord(String id) async {
    await _repository.deleteRecord(id);
  }

  Future<double> getTotalCarbon() async {
    return _repository.getTotalCarbon();
  }
}

