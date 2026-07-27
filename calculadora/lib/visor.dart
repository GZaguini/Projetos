import 'package:flutter/material.dart';

class Visor extends StatelessWidget {
  const Visor({
    super.key,
    required this.texto,
    required this.conta,
  });

  final String texto;
  final String conta;

  @override
  Widget build(BuildContext context) {
    String exibicao = conta + texto;

    return Container(
      margin: const EdgeInsets.all(12),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      child: Text(
        exibicao.isEmpty ? "0" : exibicao,
        textAlign: TextAlign.end,
        style: const TextStyle(
          fontSize: 48,
          color: Colors.white,
        ),
      ),
    );
  }
}