import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';

class MateriasScreen extends ConsumerWidget {
  const MateriasScreen({super.key});

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
            const Text('Minhas Matérias', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF222222))),
            const SizedBox(height: 32),
            Expanded(
              child: tasksAsync.when(
                data: (tasks) {
                  // Agrupa as tarefas pelo nome da matéria
                  final mapMaterias = <String, int>{};
                  for (var t in tasks) {
                    mapMaterias[t.subject] = (mapMaterias[t.subject] ?? 0) + 1;
                  }

                  if (mapMaterias.isEmpty) {
                    return const Center(child: Text('Nenhuma matéria cadastrada ainda.'));
                  }

                  final listaMaterias = mapMaterias.entries.toList();

                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 cards por linha
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: listaMaterias.length,
                    itemBuilder: (context, index) {
                      final materia = listaMaterias[index].key;
                      final qtdTarefas = listaMaterias[index].value;

                      return Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFF5A449A).withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFF5A449A).withValues(alpha: 0.2)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.menu_book_rounded, size: 40, color: Color(0xFF5A449A)),
                            const SizedBox(height: 16),
                            Text(materia, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            const SizedBox(height: 8),
                            Text('$qtdTarefas tarefa(s)', style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      );
                    },
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