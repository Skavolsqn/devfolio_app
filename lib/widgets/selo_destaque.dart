import 'package:flutter/material.dart';
import '../theme/app_cores.dart';

/// Selo flutuante (usado dentro de um Stack com Positioned).
class SeloDestaque extends StatelessWidget {
  final String texto;
  final Color cor;

  const SeloDestaque({
    super.key,
    required this.texto,
    this.cor = AppCores.amarelo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: cor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: cor.withValues(alpha: 0.7)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: 11, color: cor),
          const SizedBox(width: 3),
          Text(
            '#$texto',
            style: mono.copyWith(
              color: cor,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}