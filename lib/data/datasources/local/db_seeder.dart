import 'package:drift/drift.dart';
import 'app_database.dart';

Future<void> seedDefaults(AppDatabase db) async {
  final existing = await db.categoryDao.getAll();
  if (existing.isNotEmpty) return;

  final now = DateTime.now().millisecondsSinceEpoch;

  final defaultCategories = [
    {
      'id': 'cat_food',
      'name': 'Food',
      'iconCode': 'restaurant',
      'colorValue': 0xFFE53E3E,
      'type': 'expense',
    },
    {
      'id': 'cat_transport',
      'name': 'Transport',
      'iconCode': 'directions_bus',
      'colorValue': 0xFF3B82F6,
      'type': 'expense',
    },
    {
      'id': 'cat_salary',
      'name': 'Salary',
      'iconCode': 'paid',
      'colorValue': 0xFF22C55E,
      'type': 'income',
    },
  ];

  for (final c in defaultCategories) {
    await db
        .into(db.categories)
        .insert(
          CategoriesCompanion(
            id: Value(c['id'] as String),
            name: Value(c['name'] as String),
            iconCode: Value(c['iconCode'] as String),
            colorValue: Value(c['colorValue'] as int),
            type: Value(c['type'] as String),
            isDefault: Value(true),
            createdAt: Value(now),
          ),
        );
  }

  // sample account
  await db
      .into(db.accounts)
      .insert(
        AccountsCompanion(
          id: Value('acc_cash'),
          name: Value('Cash'),
          type: Value('cash'),
          initialBalance: Value(0.0),
          colorValue: Value(0xFF64748B),
          iconCode: Value('account_balance_wallet'),
          createdAt: Value(now),
        ),
      );
}
