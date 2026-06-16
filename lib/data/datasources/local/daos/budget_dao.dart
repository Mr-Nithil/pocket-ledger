import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/budgets_table.dart';

part 'budget_dao.g.dart';

@DriftAccessor(tables: [Budgets])
class BudgetDao extends DatabaseAccessor<AppDatabase> with _$BudgetDaoMixin {
  final AppDatabase db;
  BudgetDao(this.db) : super(db);

  Future<List<Budget>> getAll() => select(budgets).get();
  Stream<List<Budget>> watchAll() => select(budgets).watch();
  Future<void> insertBudget(Insertable<Budget> b) => into(budgets).insert(b);
  Future<bool> updateBudget(Insertable<Budget> b) => update(budgets).replace(b);
  Future<int> deleteById(String id) =>
      (delete(budgets)..where((t) => t.id.equals(id))).go();
}
