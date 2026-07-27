import 'package:flutter/material.dart';

/// Widget responsável por exibir a operação e o resultado da calculadora.
class Visor extends StatelessWidget {
  const Visor({
    super.key,
    required this.texto,
    required this.conta,
  });

  // Número atual ou resultado da operação.
  final String texto;

  // Expressão matemática montada pelo usuário.
  final String conta;

  @override
  Widget build(BuildContext context) {

    // Junta a operação com o valor atual para exibição.
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
        // Exibe "0" quando o visor estiver vazio.
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