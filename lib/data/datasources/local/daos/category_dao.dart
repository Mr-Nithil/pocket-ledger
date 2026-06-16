import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/categories_table.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  final AppDatabase db;
  CategoryDao(this.db) : super(db);

  Future<List<Category>> getAll() => select(categories).get();
  Stream<List<Category>> watchAll() => select(categories).watch();
  Future<void> insertCategory(Insertable<Category> c) =>
      into(categories).insert(c);
  Future<bool> updateCategory(Insertable<Category> c) =>
      update(categories).replace(c);
  Future<int> deleteById(String id) =>
      (delete(categories)..where((t) => t.id.equals(id))).go();
}
