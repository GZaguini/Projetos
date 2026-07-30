import 'package:flutter/material.dart';
import 'tarefa.dart';
import 'campo_tarefa.dart';
import 'item_tarefa.dart';

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
      tarefas.add(Tarefa(titulo: tarefaController.text));

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
                  return ItemTarefa(
                    tarefa: tarefas[index],
                    onAlterar: (valor) {
                      setState(() {
                        tarefas[index].concluida = valor;
                      });
                    },
                    onExcluir: () {
                      setState(() {
                        tarefas.removeAt(index);
                      });
                    },
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
