import 'package:flutter/material.dart';
import 'tarefa.dart';
import 'campo_tarefa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Lista de tarefas
  List<Tarefa> tarefas = [];

  // Controller do campo de texto
  final TextEditingController tarefaController = TextEditingController();

  // Adiciona uma nova tarefa
  void adicionarTarefa() {
    if (tarefaController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      tarefas.add(
        Tarefa(
          titulo: tarefaController.text,
        ),
      );

      tarefaController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Tarefas'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            CampoTarefa(
  controller: tarefaController,
  onPressed: adicionarTarefa,
),

            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa = tarefas[index];

                  return ListTile(
                    // Checkbox
                    leading: Checkbox(
                      value: tarefa.concluida,
                      onChanged: (novoValor) {
                        setState(() {
                          tarefa.concluida = novoValor ?? false;
                        });
                      },
                    ),

                    // Nome da tarefa
                    title: Text(
                      tarefa.titulo,
                      style: TextStyle(
                        decoration: tarefa.concluida
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: tarefa.concluida
                            ? Colors.grey
                            : Colors.black,
                      ),
                    ),

                    // Botão de excluir
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          tarefas.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}