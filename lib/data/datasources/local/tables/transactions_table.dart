import 'package:drift/drift.dart';

class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get type => text().withLength(min: 1, max: 16)();
  RealColumn get amount => real()();
  TextColumn get categoryId => text().withLength(min: 1, max: 128)();
  TextColumn get accountId => text().withLength(min: 1, max: 128)();
  TextColumn get toAccountId => text().nullable()();
  IntColumn get date => integer()();
  TextColumn get note => text().nullable()();
  TextColumn get receiptImagePath => text().nullable()();
  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();
  TextColumn get recurringInterval => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
