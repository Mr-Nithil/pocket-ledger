import 'package:drift/drift.dart';

class Accounts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 128)();
  TextColumn get type => text().withLength(min: 1, max: 32)();
  RealColumn get initialBalance => real().withDefault(const Constant(0.0))();
  IntColumn get colorValue => integer()();
  TextColumn get iconCode => text().withLength(min: 1, max: 64)();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
