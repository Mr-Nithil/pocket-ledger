import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/accounts_table.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [Accounts])
class AccountDao extends DatabaseAccessor<AppDatabase> with _$AccountDaoMixin {
  final AppDatabase db;
  AccountDao(this.db) : super(db);

  Future<List<Account>> getAll() => select(accounts).get();
  Stream<List<Account>> watchAll() => select(accounts).watch();
  Future<void> insertAccount(Insertable<Account> a) => into(accounts).insert(a);
  Future<bool> updateAccount(Insertable<Account> a) =>
      update(accounts).replace(a);
  Future<int> deleteById(String id) =>
      (delete(accounts)..where((t) => t.id.equals(id))).go();

  Future<double> computeBalance(String accountId) async {
    // Placeholder: computation to be implemented using transactions join
    return (await (select(
      accounts,
    )..where((a) => a.id.equals(accountId))).get()).first.initialBalance;
  }
}
