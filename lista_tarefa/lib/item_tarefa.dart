import 'package:flutter/material.dart';
import 'tarefa.dart';

class ItemTarefa extends StatelessWidget {
  const ItemTarefa({
    super.key,
    required this.tarefa,
    required this.onAlterar,
    required this.onExcluir,
  });

  final Tarefa tarefa;
  final ValueChanged<bool> onAlterar;
  final VoidCallback onExcluir;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: tarefa.concluida,
        onChanged: (novoValor) {
          onAlterar(novoValor ?? false);
        },
      ),

      title: Text(
        tarefa.titulo,
        style: TextStyle(
          decoration: tarefa.concluida
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          color: tarefa.concluida ? Colors.grey : Colors.black,
        ),
      ),

      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onExcluir,
      ),
    );
  }
}
