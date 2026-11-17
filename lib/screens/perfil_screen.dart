import 'package:flutter/material.dart';
import '../widgets/cracha_desenvolvedor.dart';
import '../widgets/chip_habilidade.dart';

/// Logos oficiais das tecnologias (Devicon).
const String _cdn = 'https://cdn.jsdelivr.net/gh/devicons/devicon@v2.16.0/icons';

/// Tela 01 — Perfil & Crachá do Desenvolvedor.
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          // Entrada suave: fade + subida
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutCubic,
            builder: (context, v, child) => Opacity(
              opacity: v,
              child: Transform.translate(
                offset: Offset(0, 24 * (1 - v)),
                child: child,
              ),
            ),
            child: const CrachaDesenvolvedor(
              devs: [
                Desenvolvedor(
                  nome: 'Ronaldo de Souza',
                  email: 'ronaldo.s.rodrigues9@aluno.senai.br',
                  foto: 'assets/images/fotoronaldo.png',
                ),
                Desenvolvedor(
                  nome: 'Gustavo Rodrigues',
                  email: 'gustavo.r.souza@aluno.senai.br',
                  foto: 'assets/images/fotogustavo.png',
                ),
              ],
              cargo: 'Desenvolvedores Mobile Flutter',
              cidade: 'Mauá, SP',
              habilidades: [
                ChipHabilidade(
                  nome: 'Flutter',
                  logo: '$_cdn/flutter/flutter-original.svg',
                ),
                ChipHabilidade(
                  nome: 'Dart',
                  logo: '$_cdn/dart/dart-original.svg',
                ),
                ChipHabilidade(
                  nome: 'Git',
                  logo: '$_cdn/git/git-original.svg',
                ),
                ChipHabilidade(
                  nome: 'GitHub',
                  logo: '$_cdn/github/github-original.svg',
                ),
                ChipHabilidade(
                  nome: 'Linux/SSH',
                  logo: '$_cdn/linux/linux-original.svg',
                ),
                ChipHabilidade(
                  nome: 'Material Design',
                  logo: '$_cdn/materialui/materialui-original.svg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}