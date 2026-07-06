import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

enum TaskPriority { baixa, media, alta }

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get subject => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dueDate => dateTime()();
  TextColumn get description => text().nullable()();
  IntColumn get priority => intEnum<TaskPriority>()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertTask(TasksCompanion task) => into(tasks).insert(task);
  
  Stream<List<Task>> watchTasks({String? search, TaskPriority? priority}) {
    final query = select(tasks);
    if (search != null && search.isNotEmpty) {
      query.where((t) => t.title.like('%$search%') | t.subject.like('%$search%'));
    }
    if (priority != null) query.where((t) => t.priority.equals(priority.index));
    query.orderBy([(t) => OrderingTerm(expression: t.dueDate)]);
    return query.watch();
  }

  Future<bool> updateTask(Task task) => update(tasks).replace(task);
  Future<int> deleteTask(int id) => (delete(tasks)..where((t) => t.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'educaplan.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}