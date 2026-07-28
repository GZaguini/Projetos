import 'package:flutter/material.dart';
import 'tarefa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Tarefa> tarefas = [];
  final TextEditingController tarefaController = TextEditingController();
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
        appBar: AppBar(title: const Text('Lista de Tarefa'), centerTitle: true),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: tarefaController,
                      decoration: const InputDecoration(
                        labelText: 'Digite uma tarefa:',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: adicionarTarefa,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa = tarefas[index];
                  return ListTile(
                    leading: Checkbox(
                      value: tarefa.concluida,
                      onChanged: (novoValor) {
                        setState(() {
                          tarefa.concluida = novoValor!;
                        });
                      },
                    ),
                    title: Text(tarefas[index].titulo),
                    trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: (){
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
