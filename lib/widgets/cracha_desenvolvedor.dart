import 'package:flutter/material.dart';
import '../theme/app_cores.dart';
import 'chip_habilidade.dart';

class Desenvolvedor {
  final String nome;
  final String email;
  final String foto; // caminho do asset

  const Desenvolvedor({
    required this.nome,
    required this.email,
    required this.foto,
  });

  String get iniciais {
    final partes = nome.trim().split(RegExp(r'\s+'));
    if (partes.length == 1) return partes.first[0].toUpperCase();
    return (partes.first[0] + partes.last[0]).toUpperCase();
  }
}

/// Crachá do desenvolvedor no estilo "janela de editor de código".
class CrachaDesenvolvedor extends StatelessWidget {
  final List<Desenvolvedor> devs;
  final String cargo;
  final String cidade;
  final List<ChipHabilidade> habilidades;

  const CrachaDesenvolvedor({
    super.key,
    required this.devs,
    required this.cargo,
    required this.cidade,
    required this.habilidades,
  });

  static const double _fotoSize = 104;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(2), // espessura da borda em gradiente
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: AppCores.gradiente,
        boxShadow: [
          BoxShadow(
            color: AppCores.roxo.withValues(alpha: 0.35),
            blurRadius: 40,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Container(
          color: AppCores.superficie,
          child: Stack(
            children: [
              Positioned(top: -80, right: -60, child: _brilho(220, AppCores.roxo)),
              Positioned(bottom: -90, left: -70, child: _brilho(240, AppCores.rosa)),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _furoCordao(),
                  _barraJanela(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 24, 22, 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _perfis(),
                        const SizedBox(height: 18),
                        _chipCargo(),
                        const SizedBox(height: 22),
                        _painelTerminal(),
                        const SizedBox(height: 22),
                        _secaoHabilidades(),
                      ],
                    ),
                  ),
                  _barraStatus(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Topo ----------

  Widget _furoCordao() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Container(
        width: 64,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppCores.borda),
        ),
      ),
    );
  }

  Widget _barraJanela() {
    Widget bolinha(Color c) => Container(
          width: 11,
          height: 11,
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(color: c, shape: BoxShape.circle),
        );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        border: const Border.symmetric(
          horizontal: BorderSide(color: AppCores.borda),
        ),
      ),
      child: Row(
        children: [
          bolinha(const Color(0xFFFF5F56)),
          bolinha(const Color(0xFFFFBD2E)),
          bolinha(const Color(0xFF27C93F)),
          const Spacer(),
          Icon(Icons.description_outlined,
              size: 14, color: AppCores.textoSuave),
          const SizedBox(width: 6),
          Text(
            'cracha.dart',
            style: mono.copyWith(fontSize: 12, color: AppCores.textoSuave),
          ),
          const Spacer(),
          const SizedBox(width: 51), // equilibra as bolinhas
        ],
      ),
    );
  }

  // ---------- Perfis ----------

  Widget _perfis() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < devs.length; i++) ...[
          if (i > 0)
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 38, 10, 0),
              child: Text(
                '&',
                style: mono.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppCores.rosa,
                ),
              ),
            ),
          Flexible(child: _cardDev(devs[i])),
        ],
      ],
    );
  }

  Widget _cardDev(Desenvolvedor d) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _foto(d),
        const SizedBox(height: 12),
        Text(
          d.nome,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 17,
            height: 1.2,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _foto(Desenvolvedor d) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: _fotoSize,
          height: _fotoSize,
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppCores.gradiente,
          ),
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppCores.superficie,
            ),
            child: ClipOval(
              child: Image.asset(
                d.foto,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.2),
                // Se a foto falhar, mostra as iniciais
                errorBuilder: (_, __, ___) => Container(
                  color: AppCores.indigo,
                  alignment: Alignment.center,
                  child: Text(
                    d.iniciais,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Bolinha "online"
        Positioned(
          right: 4,
          bottom: 4,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: AppCores.verde,
              shape: BoxShape.circle,
              border: Border.all(color: AppCores.superficie, width: 3),
            ),
          ),
        ),
      ],
    );
  }

  Widget _chipCargo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: AppCores.indigo.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppCores.indigo.withValues(alpha: 0.6)),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '</> ',
              style: mono.copyWith(
                color: AppCores.rosa,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: cargo,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  // ---------- Terminal de contato ----------

  Widget _painelTerminal() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppCores.fundo,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppCores.borda),
      ),
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
                TextSpan(
                  text: 'cat contato.json',
                  style: TextStyle(color: AppCores.textoSuave),
                ),
              ],
            ),
            style: mono.copyWith(fontSize: 13),
          ),
          const SizedBox(height: 12),
          for (final d in devs) ...[
            _linhaInfo(Icons.alternate_email, d.email),
            const SizedBox(height: 8),
          ],
          _linhaInfo(Icons.location_on_outlined, cidade),
        ],
      ),
    );
  }

  Widget _linhaInfo(IconData icone, String texto) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icone, color: AppCores.rosa, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            texto,
            style: mono.copyWith(fontSize: 13, color: AppCores.texto),
          ),
        ),
      ],
    );
  }

  // ---------- Habilidades ----------

  Widget _secaoHabilidades() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '// ',
                style: TextStyle(color: AppCores.textoSuave),
              ),
              const TextSpan(
                text: 'habilidades',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          style: mono.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 12),
        // Wrap quebra linha automaticamente: evita overflow.
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: habilidades,
        ),
      ],
    );
  }

  // ---------- Rodapé estilo barra de status do VS Code ----------

  Widget _barraStatus() {
    Widget item(IconData i, String t) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(i, size: 14, color: Colors.white),
            const SizedBox(width: 4),
            Text(t, style: mono.copyWith(fontSize: 11, color: Colors.white)),
          ],
        );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(gradient: AppCores.gradiente),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          item(Icons.call_split, 'main'),
          item(Icons.check_circle_outline, '0 erros'),
          item(Icons.flutter_dash, 'Flutter · Dart'),
        ],
      ),
    );
  }

  Widget _brilho(double tamanho, Color cor) {
    return Container(
      width: tamanho,
      height: tamanho,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [cor.withValues(alpha: 0.28), Colors.transparent],
        ),
      ),
    );
  }
}