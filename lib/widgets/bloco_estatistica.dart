import 'package:flutter/material.dart';
import '../theme/app_cores.dart';
import 'selo_destaque.dart';

/// Bloco de estatística para o GridView do dashboard (com efeito hover).
class BlocoEstatistica extends StatefulWidget {
  final String titulo;
  final String valor;
  final IconData icone;
  final Color cor;
  final String? selo;

  const BlocoEstatistica({
    super.key,
    required this.titulo,
    required this.valor,
    required this.icone,
    required this.cor,
    this.selo,
  });

  @override
  State<BlocoEstatistica> createState() => _BlocoEstatisticaState();
}

class _BlocoEstatisticaState extends State<BlocoEstatistica> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final cor = widget.cor;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _hover ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: AppCores.superficie,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hover ? cor : AppCores.borda,
          ),
          boxShadow: [
            BoxShadow(
              color: cor.withValues(alpha: _hover ? 0.35 : 0.12),
              blurRadius: _hover ? 24 : 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Linha de destaque no topo
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [cor, cor.withValues(alpha: 0.1)],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 20, 14, 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: cor.withValues(alpha: 0.14),
                      border: Border.all(color: cor.withValues(alpha: 0.35)),
                    ),
                    child: Icon(widget.icone, size: 24, color: cor),
                  ),
                  const Spacer(),
                  // FittedBox reduz o texto se faltar espaço (sem overflow).
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.valor,
                      style: mono.copyWith(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        color: cor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.titulo,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppCores.textoSuave,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.selo != null)
              Positioned(
                top: 14,
                right: 10,
                child: SeloDestaque(texto: widget.selo!),
              ),
          ],
        ),
      ),
    );
  }
}