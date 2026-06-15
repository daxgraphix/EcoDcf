import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/features/carbon/data/models/carbon_record_model.dart';
import 'package:ecodcf/features/device_usage/data/models/device_usage_model.dart';
import 'package:ecodcf/features/challenges/data/models/challenge_model.dart';
import 'package:ecodcf/features/gamification/data/models/badge_model.dart';
import 'package:ecodcf/core/database/isar/models/user_preferences_model.dart';

part 'isar_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(IsarRef ref) async {
  return IsarProvider.openIsar();
}

class IsarProvider {
  static Future<Isar> openIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = Isar.getInstance();
    if (isar != null && isar.isOpen) {
      return isar;
    }
    return Isar.open(
      [
        CarbonRecordModelSchema,
        DeviceUsageModelSchema,
        ChallengeModelSchema,
        BadgeModelSchema,
        UserPreferencesModelSchema,
      ],
      directory: dir.path,
    );
  }
}

