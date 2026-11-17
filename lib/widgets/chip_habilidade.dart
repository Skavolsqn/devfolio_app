import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_cores.dart';

/// Chip de habilidade com o logo oficial da tecnologia (SVG).
class ChipHabilidade extends StatelessWidget {
  final String nome;
  final String logo; // URL (ou asset) do SVG da tecnologia

  const ChipHabilidade({super.key, required this.nome, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 6, 12, 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppCores.borda),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Fundo claro para qualquer logo (ex.: GitHub preto) aparecer bem
          Container(
            width: 28,
            height: 28,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.network(
              logo,
              fit: BoxFit.contain,
              placeholderBuilder: (_) => const SizedBox.shrink(),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            nome,
            style: const TextStyle(
              color: AppCores.texto,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}