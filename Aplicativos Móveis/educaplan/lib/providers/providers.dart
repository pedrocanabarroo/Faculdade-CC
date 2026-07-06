import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database.dart';

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

final searchProvider = StateProvider<String>((ref) => '');
final filterProvider = StateProvider<TaskPriority?>((ref) => null);

final tasksStreamProvider = StreamProvider<List<Task>>((ref) {
  final db = ref.watch(databaseProvider);
  final search = ref.watch(searchProvider);
  final priority = ref.watch(filterProvider);
  return db.watchTasks(search: search, priority: priority);
});