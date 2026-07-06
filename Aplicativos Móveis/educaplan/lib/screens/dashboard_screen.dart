import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../database/database.dart';
import 'task_form_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(tasksStreamProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Minhas Tarefas', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF222222))),
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TaskFormScreen())),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Nova Tarefa'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5A449A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar tarefas...',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF5A449A))),
                    ),
                    onChanged: (val) => ref.read(searchProvider.notifier).state = val,
                  ),
                ),
                const SizedBox(width: 24),
                const _FilterPill(label: 'Todas', priority: null),
                const _FilterPill(label: 'Alta', priority: TaskPriority.alta),
                const _FilterPill(label: 'Média', priority: TaskPriority.media),
                const _FilterPill(label: 'Baixa', priority: TaskPriority.baixa),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: tasksAsync.when(
                data: (tasks) {
                  if (tasks.isEmpty) return const Center(child: Text('Nenhuma tarefa encontrada.'));
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, i) => _TaskCard(task: tasks[i]),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Text('Erro: $e'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterPill extends ConsumerWidget {
  final String label;
  final TaskPriority? priority;
  
  const _FilterPill({required this.label, this.priority});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(filterProvider) == priority;
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: InkWell(
        onTap: () => ref.read(filterProvider.notifier).state = priority,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF5A449A) : Colors.white,
            border: Border.all(color: isSelected ? const Color(0xFF5A449A) : Colors.grey.shade300),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(color: isSelected ? Colors.white : Colors.grey.shade800, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class _TaskCard extends ConsumerWidget {
  final Task task;
  const _TaskCard({required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<TaskPriority, Map<String, dynamic>> priorityStyles = {
      TaskPriority.alta: {'color': const Color(0xFFE57373), 'bg': const Color(0xFFFFEBEE), 'label': 'ALTA'},
      TaskPriority.media: {'color': const Color(0xFFFFB74D), 'bg': const Color(0xFFFFF8E1), 'label': 'MÉDIA'},
      TaskPriority.baixa: {'color': const Color(0xFF81C784), 'bg': const Color(0xFFE8F5E9), 'label': 'BAIXA'},
    };

    final style = priorityStyles[task.priority]!;
    final pColor = style['color'] as Color;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Linha colorida lateral
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: pColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value: task.isCompleted,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    activeColor: const Color(0xFF5A449A),
                    onChanged: (val) => ref.read(databaseProvider).updateTask(task.copyWith(isCompleted: val ?? false)),
                  ),
                ),
                title: Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                    color: const Color(0xFF222222),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.insert_drive_file_outlined, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(task.subject, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(width: 24),
                      const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.redAccent),
                      const SizedBox(width: 6),
                      Text('${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}', style: const TextStyle(color: Colors.redAccent)),
                    ],
                  ),
                ),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: style['bg'] as Color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    style['label'] as String,
                    style: TextStyle(color: pColor, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TaskFormScreen(task: task))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}