import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as d;
import '../database/database.dart';
import '../providers/providers.dart';

class TaskFormScreen extends ConsumerStatefulWidget {
  final Task? task;
  const TaskFormScreen({super.key, this.task});

  @override
  ConsumerState<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends ConsumerState<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _title;
  late TextEditingController _subject;
  late TextEditingController _desc;
  DateTime _date = DateTime.now();
  TaskPriority _priority = TaskPriority.media;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.task?.title);
    _subject = TextEditingController(text: widget.task?.subject);
    _desc = TextEditingController(text: widget.task?.description);
    if (widget.task != null) {
      _priority = widget.task!.priority;
      _date = widget.task!.dueDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.task != null;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF5A449A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          isEditing ? 'Editar Tarefa' : 'Nova Tarefa',
          style: const TextStyle(color: Color(0xFF5A449A), fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          margin: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          padding: const EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  isEditing ? 'Detalhes da Tarefa' : 'Criar Tarefa',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  isEditing ? 'Atualize as informações da sua atividade.' : 'Adicione uma nova atividade acadêmica.',
                  style: const TextStyle(color: Colors.grey),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 24), child: Divider()),
                
                const Text('Título da Tarefa', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _title,
                  decoration: _inputDeco('Ex: Estudar Álgebra Linear'),
                  validator: (val) => val == null || val.isEmpty ? 'Obrigatório' : null,
                ),
                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Matéria', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _subject,
                            decoration: _inputDeco('Ex: Matemática'),
                            validator: (val) => val == null || val.isEmpty ? 'Obrigatório' : null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Data de Entrega', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () async {
                              final picked = await showDatePicker(
                                context: context, initialDate: _date, firstDate: DateTime.now(), lastDate: DateTime(2100)
                              );
                              if (picked != null) setState(() => _date = picked);
                            },
                            child: InputDecorator(
                              decoration: _inputDeco('').copyWith(suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey)),
                              child: Text('${_date.day}/${_date.month}/${_date.year}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                
                const Text('Prioridade', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _PriorityButton(label: 'Alta', value: TaskPriority.alta, current: _priority, onTap: () => setState(() => _priority = TaskPriority.alta)),
                    const SizedBox(width: 12),
                    _PriorityButton(label: 'Média', value: TaskPriority.media, current: _priority, onTap: () => setState(() => _priority = TaskPriority.media)),
                    const SizedBox(width: 12),
                    _PriorityButton(label: 'Baixa', value: TaskPriority.baixa, current: _priority, onTap: () => setState(() => _priority = TaskPriority.baixa)),
                  ],
                ),
                const SizedBox(height: 24),

                const Text('Anotações / Descrição', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _desc,
                  maxLines: 4,
                  decoration: _inputDeco('Adicione detalhes, links ou notas aqui...'),
                ),
                
                const Padding(padding: EdgeInsets.symmetric(vertical: 32), child: Divider()),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isEditing)
                      TextButton.icon(
                        onPressed: () {
                          ref.read(databaseProvider).deleteTask(widget.task!.id);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        label: const Text('Excluir Tarefa', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      )
                    else
                      const SizedBox.shrink(),
                      
                    Row(
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancelar', style: TextStyle(color: Color(0xFF5A449A), fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5A449A),
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final db = ref.read(databaseProvider);
                              if (isEditing) {
                                db.updateTask(widget.task!.copyWith(
                                  title: _title.text, subject: _subject.text, description: d.Value(_desc.text), dueDate: _date, priority: _priority
                                ));
                              } else {
                                db.insertTask(TasksCompanion.insert(
                                  title: _title.text, subject: _subject.text, description: d.Value(_desc.text), dueDate: _date, priority: _priority
                                ));
                              }
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Salvar Tarefa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDeco(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF5A449A))),
    );
  }
}

class _PriorityButton extends StatelessWidget {
  final String label;
  final TaskPriority value;
  final TaskPriority current;
  final VoidCallback onTap;

  const _PriorityButton({required this.label, required this.value, required this.current, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isSelected = value == current;
    Color color = switch (value) {
      TaskPriority.alta => const Color(0xFFE57373),
      TaskPriority.media => const Color(0xFFFFB74D),
      TaskPriority.baixa => const Color(0xFF81C784),
    };

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? color.withValues(alpha: 0.15) : Colors.grey.shade100,
          border: Border.all(color: isSelected ? color : Colors.grey.shade300, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            if (isSelected) ...[
              Icon(Icons.check, size: 16, color: color),
              const SizedBox(width: 8),
            ],
            Text(label, style: TextStyle(color: isSelected ? color : Colors.grey.shade700, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}