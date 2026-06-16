import 'package:drift/drift.dart';

class GoalContributions extends Table {
  TextColumn get id => text()();
  TextColumn get goalId => text().withLength(min: 1, max: 128)();
  RealColumn get amount => real()();
  IntColumn get date => integer()();
  TextColumn get note => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
