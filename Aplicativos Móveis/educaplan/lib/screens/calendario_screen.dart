import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import '../providers/providers.dart';
import '../database/database.dart';

class CalendarioScreen extends ConsumerStatefulWidget {
  const CalendarioScreen({super.key});

  @override
  ConsumerState<CalendarioScreen> createState() => _CalendarioScreenState();
}

class _CalendarioScreenState extends ConsumerState<CalendarioScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  // Função auxiliar para comparar se duas datas são o mesmo dia (ignorando horas)
  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    // Escuta as tarefas do banco de dados em tempo real
    final tasksAsync = ref.watch(tasksStreamProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calendário Acadêmico',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF222222)),
            ),
            const SizedBox(height: 32),
            
            tasksAsync.when(
              data: (tasks) {
                // Filtra as tarefas para mostrar na lista lateral apenas as do dia selecionado
                final tarefasDoDiaSelecionado = tasks.where((t) => _isSameDate(t.dueDate, _selectedDay)).toList();

                return Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LADO ESQUERDO: O CALENDÁRIO
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: TableCalendar<Task>(
                            locale: 'pt_BR', // Deixa os dias da semana em Português
                            firstDay: DateTime.utc(2020, 1, 1),
                            lastDay: DateTime.utc(2030, 12, 31),
                            focusedDay: _focusedDay,
                            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                            
                            // Ação ao clicar em um dia
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            },
                            
                            // eventLoader é responsável por colocar os "pontinhos" embaixo dos dias
                            eventLoader: (day) {
                              return tasks.where((t) => _isSameDate(t.dueDate, day)).toList();
                            },
                            
                            // Estilização para combinar com o tema roxo do EducaPlan
                            calendarStyle: CalendarStyle(
                              markerDecoration: const BoxDecoration(
                                color: Color(0xFF5A449A),
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: const BoxDecoration(
                                color: Color(0xFF5A449A),
                                shape: BoxShape.circle,
                              ),
                              todayDecoration: BoxDecoration(
                                color: const Color(0xFF5A449A).withValues(alpha: 0.3),
                                shape: BoxShape.circle,
                              ),
                            ),
                            headerStyle: const HeaderStyle(
                              formatButtonVisible: false, // Esconde o botão de "2 semanas / 1 mês"
                              titleCentered: true,
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(width: 32),
                      
                      // LADO DIREITO: LISTA DE TAREFAS DO DIA
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tarefas do dia ${_selectedDay.day}/${_selectedDay.month}',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF222222)),
                            ),
                            const SizedBox(height: 16),
                            
                            Expanded(
                              child: tarefasDoDiaSelecionado.isEmpty
                                  ? Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.event_available, size: 48, color: Colors.grey.shade400),
                                          const SizedBox(height: 16),
                                          Text('Dia livre! Nenhuma tarefa.', style: TextStyle(color: Colors.grey.shade600)),
                                        ],
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: tarefasDoDiaSelecionado.length,
                                      itemBuilder: (context, index) {
                                        final task = tarefasDoDiaSelecionado[index];
                                        return Card(
                                          elevation: 0,
                                          margin: const EdgeInsets.only(bottom: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            side: BorderSide(color: Colors.grey.shade200),
                                          ),
                                          child: ListTile(
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                            title: Text(
                                              task.title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                                              ),
                                            ),
                                            subtitle: Text(task.subject),
                                            trailing: Icon(
                                              task.isCompleted ? Icons.check_circle : Icons.circle_outlined,
                                              color: task.isCompleted ? Colors.green : Colors.grey.shade400,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Erro ao carregar dados: $e')),
            ),
          ],
        ),
      ),
    );
  }
}