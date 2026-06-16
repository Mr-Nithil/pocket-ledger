import 'package:drift/drift.dart';

class Categories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 128)();
  TextColumn get iconCode => text().withLength(min: 1, max: 64)();
  IntColumn get colorValue => integer()();
  TextColumn get type => text().withLength(min: 1, max: 16)();
  BoolColumn get isDefault => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
