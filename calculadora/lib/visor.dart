import 'package:flutter/material.dart';

class Visor extends StatelessWidget {
  const Visor({
    super.key,
    required this.texto,
  });

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
         border: Border.all(
        color: Colors.grey,
        width: 2,
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      
      
      child: Text(
        texto.isEmpty ? "0" : texto,
        textAlign: TextAlign.end,
        style: const TextStyle(
          fontSize: 48,
          color: Colors.white,
        ),
      ),
    );
  }
}