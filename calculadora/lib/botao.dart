import 'package:flutter/material.dart';

/// Widget reutilizável responsável pelos botões da calculadora.
class Botao extends StatelessWidget {
  const Botao({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  // Texto exibido no botão.
  final String texto;

  // Função executada ao pressionar o botão.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {

    // Define a cor do botão de acordo com sua função.
    Color cor = Colors.grey;

    if (texto == '+' || texto == '-' || texto == '*' || texto == '/') {
      cor = Colors.orange;
    } else if (texto == 'C' || texto == '⌫') {
      cor = Colors.blueGrey;
    } else if (texto == '=') {
      cor = Colors.green;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            minimumSize: const Size(0, 70),
          ),
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}