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
  final TextEditingController controller = TextEditingController();

void adicionarTarefa() {
  setState(() {
    tarefas.add(
      Tarefa(
        titulo: controller.text,
      ),
    );

    controller.clear();
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Lista de Tarefa'),
        centerTitle: true,),
        body:Column(
  children: [
    Padding(
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
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ],
      ),
    ),
  ],
),
      ),
    );
  }
}