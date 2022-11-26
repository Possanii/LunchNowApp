import 'package:lunch_now/app/core/database/migration/migration.dart';
import 'package:lunch_now/app/core/database/migration/migration_v1.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigrations() => [
        MigrationV1(),
      ];

  List<Migration> getUpdateMigrations(int version) {
    return [];
  }
}
