import 'package:flutter/material.dart';

class CampoTarefa extends StatelessWidget {
  const CampoTarefa({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  final TextEditingController controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(12),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Digite uma tarefa:',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: const Icon(Icons.add),
        ),
      ],
    ),
  );
}
  }
