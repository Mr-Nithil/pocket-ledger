import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/goals_table.dart';
import '../tables/goal_contributions_table.dart';

part 'goal_dao.g.dart';

@DriftAccessor(tables: [Goals, GoalContributions])
class GoalDao extends DatabaseAccessor<AppDatabase> with _$GoalDaoMixin {
  final AppDatabase db;
  GoalDao(this.db) : super(db);

  Future<List<Goal>> getAll() => select(goals).get();
  Stream<List<Goal>> watchAll() => select(goals).watch();
  Future<void> insertGoal(Insertable<Goal> g) => into(goals).insert(g);
  Future<bool> updateGoal(Insertable<Goal> g) => update(goals).replace(g);
  Future<int> deleteGoalById(String id) =>
      (delete(goals)..where((t) => t.id.equals(id))).go();

  Future<void> addContribution(Insertable<GoalContribution> c) =>
      into(goalContributions).insert(c);
  Future<List<GoalContribution>> contributionsFor(String goalId) =>
      (select(goalContributions)..where((g) => g.goalId.equals(goalId))).get();
}
