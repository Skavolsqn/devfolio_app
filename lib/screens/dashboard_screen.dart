import 'package:flutter/material.dart';
import '../theme/app_cores.dart';
import '../widgets/bloco_estatistica.dart';

/// Tela 02 — Dashboard de Projetos & Métricas.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: r'$ ',
                      style: TextStyle(color: AppCores.verde),
                    ),
                    const TextSpan(text: 'Minhas Métricas'),
                  ],
                ),
                style: mono.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '// Resumo da sua evolução como desenvolvedor',
                style: mono.copyWith(
                  fontSize: 13,
                  color: AppCores.textoSuave,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView(
                  // Colunas se adaptam à largura; altura fixa evita overflow.
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 240,
                    mainAxisExtent: 180,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                  ),
                  children: const [
                    BlocoEstatistica(
                      titulo: 'Projetos concluídos',
                      valor: '12',
                      icone: Icons.check_circle,
                      cor: Color(0xFF3FB950),
                      selo: 'TOP',
                    ),
                    BlocoEstatistica(
                      titulo: 'Commits no GitHub',
                      valor: '248',
                      icone: Icons.commit,
                      cor: Color(0xFF6366F1),
                    ),
                    BlocoEstatistica(
                      titulo: 'Telas criadas',
                      valor: '18',
                      icone: Icons.phone_android,
                      cor: Color(0xFFA855F7),
                      selo: 'NOVO',
                    ),
                    BlocoEstatistica(
                      titulo: 'Widgets reutilizáveis',
                      valor: '9',
                      icone: Icons.widgets,
                      cor: Color(0xFFEC4899),
                    ),
                    BlocoEstatistica(
                      titulo: 'Horas de estudo',
                      valor: '120h',
                      icone: Icons.schedule,
                      cor: Color(0xFFF59E0B),
                    ),
                    BlocoEstatistica(
                      titulo: 'Erros de overflow',
                      valor: '0',
                      icone: Icons.bug_report,
                      cor: Color(0xFFEF4444),
                      selo: 'ZERO',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}