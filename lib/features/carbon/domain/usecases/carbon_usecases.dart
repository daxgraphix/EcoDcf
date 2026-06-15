import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';
import 'package:ecodcf/features/carbon/domain/repositories/carbon_repository.dart';

abstract class GetCarbonRecordsUseCase {
  Future<List<CarbonRecord>> call();
}

class GetCarbonRecordsUseCaseImpl implements GetCarbonRecordsUseCase {
  final CarbonRepository _repository;

  GetCarbonRecordsUseCaseImpl(this._repository);

  @override
  Future<List<CarbonRecord>> call() => _repository.getAllRecords();
}

abstract class SaveCarbonRecordUseCase {
  Future<void> call(CarbonRecord record);
}

class SaveCarbonRecordUseCaseImpl implements SaveCarbonRecordUseCase {
  final CarbonRepository _repository;

  SaveCarbonRecordUseCaseImpl(this._repository);

  @override
  Future<void> call(CarbonRecord record) => _repository.saveRecord(record);
}

abstract class GetTotalCarbonUseCase {
  Future<double> call({DateTime? start, DateTime? end});
}

class GetTotalCarbonUseCaseImpl implements GetTotalCarbonUseCase {
  final CarbonRepository _repository;

  GetTotalCarbonUseCaseImpl(this._repository);

  @override
  Future<double> call({DateTime? start, DateTime? end}) => _repository.getTotalCarbon(start: start, end: end);
}
