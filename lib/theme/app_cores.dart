import 'package:flutter/material.dart';

/// Paleta inspirada em editores de código (tema dark estilo GitHub/VS Code).
class AppCores {
  static const fundo = Color(0xFF0D1117);
  static const superficie = Color(0xFF161B22);
  static const borda = Color(0xFF30363D);
  static const texto = Color(0xFFE6EDF3);
  static const textoSuave = Color(0xFF8B949E);

  static const indigo = Color(0xFF4F46E5);
  static const roxo = Color(0xFF9333EA);
  static const rosa = Color(0xFFEC4899);
  static const verde = Color(0xFF3FB950);
  static const amarelo = Color(0xFFF59E0B);

  static const gradiente = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [indigo, roxo, rosa],
  );
}

/// Estilo monoespaçado para os detalhes "de código".
const TextStyle mono = TextStyle(
  fontFamily: 'monospace',
  fontFamilyFallback: ['Courier New', 'Consolas', 'Menlo'],
);