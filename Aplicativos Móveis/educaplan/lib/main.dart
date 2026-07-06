import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart'; // Novo import necessário
import 'screens/main_layout.dart';

// O main agora precisa ser 'async'
void main() async {
  // Garante que o motor do Flutter inicie antes de carregarmos configurações
  WidgetsFlutterBinding.ensureInitialized();
  
  // Carrega os dados de calendário e datas para o Brasil
  await initializeDateFormatting('pt_BR', null);

  runApp(const ProviderScope(child: EducaPlanApp()));
}

class EducaPlanApp extends StatelessWidget {
  const EducaPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EducaPlan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5A449A)),
      ),
      home: const MainLayout(),
    );
  }
}