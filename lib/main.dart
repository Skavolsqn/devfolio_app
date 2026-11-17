import 'package:flutter/material.dart';
import 'screens/perfil_screen.dart';
import 'screens/dashboard_screen.dart';
import 'theme/app_cores.dart';

void main() => runApp(const DevFolioApp());

class DevFolioApp extends StatelessWidget {
  const DevFolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFolio App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppCores.indigo,
          brightness: Brightness.dark,
        ).copyWith(surface: AppCores.superficie),
        scaffoldBackgroundColor: AppCores.fundo,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppCores.superficie,
          indicatorColor: AppCores.indigo.withValues(alpha: 0.35),
          labelTextStyle: WidgetStatePropertyAll(
            mono.copyWith(fontSize: 12, color: AppCores.texto),
          ),
        ),
      ),
      home: const HomeShell(),
    );
  }
}

/// Estrutura principal com navegação entre as duas telas.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _indice = 0;

  final List<Widget> _telas = const [
    PerfilScreen(),
    DashboardScreen(),
  ];

  final List<String> _titulos = const [
    'Perfil & Crachá',
    'Dashboard de Projetos',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: AppCores.gradiente),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '</>',
              style: mono.copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              _titulos[_indice],
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Fundo pontilhado (grid de editor) + brilho no topo
          Positioned.fill(child: CustomPaint(painter: _FundoGrade())),
          Align(
            alignment: Alignment.topCenter,
            child: IgnorePointer(
              child: Container(
                width: 700,
                height: 400,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      AppCores.roxo.withValues(alpha: 0.22),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: KeyedSubtree(
              key: ValueKey(_indice),
              child: _telas[_indice],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.badge_outlined),
            selectedIcon: Icon(Icons.badge),
            label: 'Perfil',
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
      ),
    );
  }
}

class _FundoGrade extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = Colors.white.withValues(alpha: 0.05);
    for (double x = 0; x < size.width; x += 28) {
      for (double y = 0; y < size.height; y += 28) {
        canvas.drawCircle(Offset(x, y), 1.2, p);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}