import 'package:drift/drift.dart';

class Budgets extends Table {
  TextColumn get id => text()();
  TextColumn get categoryId => text().nullable()();
  RealColumn get limitAmount => real()();
  IntColumn get month => integer()();
  IntColumn get year => integer()();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
