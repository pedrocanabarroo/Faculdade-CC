import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';

class VisaoGeralScreen extends ConsumerWidget {
  const VisaoGeralScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuta todas as tarefas no banco
    final tasksAsync = ref.watch(tasksStreamProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Olá, Pedro!', 
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF222222))
            ),
            const SizedBox(height: 8),
            const Text(
              'Aqui está o resumo do seu semestre acadêmico.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            
            tasksAsync.when(
              data: (tasks) {
                final concluidas = tasks.where((t) => t.isCompleted).length;
                final pendentes = tasks.length - concluidas;
                final atrasadas = tasks.where((t) => !t.isCompleted && t.dueDate.isBefore(DateTime.now())).length;

                return Row(
                  children: [
                    Expanded(child: _InfoCard(titulo: 'Tarefas Pendentes', valor: pendentes.toString(), cor: Colors.orangeAccent, icone: Icons.pending_actions)),
                    const SizedBox(width: 24),
                    Expanded(child: _InfoCard(titulo: 'Concluídas', valor: concluidas.toString(), cor: Colors.green, icone: Icons.check_circle_outline)),
                    const SizedBox(width: 24),
                    Expanded(child: _InfoCard(titulo: 'Atrasadas', valor: atrasadas.toString(), cor: Colors.redAccent, icone: Icons.warning_amber_rounded)),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Erro ao carregar métricas: $e'),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final Color cor;
  final IconData icone;

  const _InfoCard({required this.titulo, required this.valor, required this.cor, required this.icone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(titulo, style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
              Icon(icone, color: cor),
            ],
          ),
          const SizedBox(height: 16),
          Text(valor, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF333333))),
        ],
      ),
    );
  }
}