import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'visao_geral_screen.dart';
import 'materias_screen.dart';
import 'calendario_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 1; // Começa na aba "Minhas Tarefas"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: Row(
        children: [
          // BARRA LATERAL (SIDEBAR)
          Container(
            width: 260,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFF5A449A),
                        child: Icon(Icons.school, color: Colors.white),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('EducaPlan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF333333))),
                          Text('Gerente Acadêmico', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _SidebarItem(icon: Icons.dashboard_outlined, title: 'Dashboard', isSelected: _selectedIndex == 0, onTap: () => setState(() => _selectedIndex = 0)),
                _SidebarItem(icon: Icons.check_box_outlined, title: 'Minhas Tarefas', isSelected: _selectedIndex == 1, onTap: () => setState(() => _selectedIndex = 1)),
                _SidebarItem(icon: Icons.menu_book_outlined, title: 'Matérias', isSelected: _selectedIndex == 2, onTap: () => setState(() => _selectedIndex = 2)),
                _SidebarItem(icon: Icons.calendar_month_outlined, title: 'Calendário', isSelected: _selectedIndex == 3, onTap: () => setState(() => _selectedIndex = 3)),
                const Spacer(),
                _SidebarItem(icon: Icons.settings_outlined, title: 'Configurações', isSelected: _selectedIndex == 4, onTap: () => setState(() => _selectedIndex = 4)),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1, color: Color(0xFFEEEEEE)),
          
          // CONTEÚDO DA TELA DINÂMICO
          Expanded(
            child: _getScreen(_selectedIndex), 
          ),
        ],
      ),
    );
  }

  // Controle de qual tela será exibida
  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return const VisaoGeralScreen();
      case 1:
        return const DashboardScreen();
      case 2:
        return const MateriasScreen();
      case 3:
        return const CalendarioScreen();
      default:
        return const Center(child: Text('Configurações em breve...'));
    }
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItem({required this.icon, required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFEBE4FF) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(icon, color: isSelected ? const Color(0xFF5A449A) : Colors.grey[700], size: 20),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? const Color(0xFF5A449A) : Colors.grey[800],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}