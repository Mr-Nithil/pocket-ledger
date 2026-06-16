import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/accounts_table.dart';
import 'tables/categories_table.dart';
import 'tables/transactions_table.dart';
import 'tables/budgets_table.dart';
import 'tables/goals_table.dart';
import 'tables/goal_contributions_table.dart';
import 'daos/transaction_dao.dart';
import 'daos/category_dao.dart';
import 'daos/account_dao.dart';
import 'daos/budget_dao.dart';
import 'daos/goal_dao.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'pocket_ledger.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    Accounts,
    Categories,
    Transactions,
    Budgets,
    Goals,
    GoalContributions,
  ],
  daos: [TransactionDao, CategoryDao, AccountDao, BudgetDao, GoalDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // DAOs are generated
  @override
  TransactionDao get transactionDao => TransactionDao(this);
  @override
  CategoryDao get categoryDao => CategoryDao(this);
  @override
  AccountDao get accountDao => AccountDao(this);
  @override
  BudgetDao get budgetDao => BudgetDao(this);
  @override
  GoalDao get goalDao => GoalDao(this);

  @override
  int get schemaVersion => 1;
}
