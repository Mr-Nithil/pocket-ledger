import 'package:drift/drift.dart';

class Goals extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 128)();
  RealColumn get targetAmount => real()();
  RealColumn get savedAmount => real().withDefault(const Constant(0.0))();
  IntColumn get deadline => integer()();
  IntColumn get colorValue => integer()();
  TextColumn get iconCode => text().withLength(min: 1, max: 64)();
  TextColumn get note => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
