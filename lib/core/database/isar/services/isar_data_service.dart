import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDataService {
  final Isar _isar;

  IsarDataService(this._isar);

  /// Exports all data from the current Isar database.
  /// For simplicity, we return the path to the database file itself as an export.
  /// In a production app, this might be a JSON export.
  Future<File> exportData() async {
    final dbPath = _isar.path;
    if (dbPath == null) throw Exception("Database path not found");
    
    final tempDir = await getTemporaryDirectory();
    final exportFile = File("${tempDir.path}/EcoDcf_Backup_${DateTime.now().millisecondsSinceEpoch}.isar");
    
    // Using copy instead of move to keep the current DB working
    return File(dbPath).copy(exportFile.path);
  }

  /// Clears all collections in the database.
  Future<void> clearAllData() async {
    await _isar.writeTxn(() async {
      await _isar.clear();
    });
  }

  /// Deletes the entire database file.
  /// Note: Isar must be closed before calling this.
  static Future<void> deleteDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbDir = Directory(dir.path);
    if (await dbDir.exists()) {
      await dbDir.delete(recursive: true);
    }
  }
}
