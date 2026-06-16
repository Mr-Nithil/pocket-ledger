import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/transactions_table.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [Transactions])
class TransactionDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionDaoMixin {
  final AppDatabase db;
  TransactionDao(this.db) : super(db);

  Future<List<Transaction>> getAll() => select(transactions).get();
  Stream<List<Transaction>> watchAll() => select(transactions).watch();
  Future<void> insertTx(Insertable<Transaction> tx) =>
      into(transactions).insert(tx);
  Future<bool> updateTx(Insertable<Transaction> tx) =>
      update(transactions).replace(tx);
  Future<int> deleteById(String id) =>
      (delete(transactions)..where((t) => t.id.equals(id))).go();
}
