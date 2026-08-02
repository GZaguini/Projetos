import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'campo_tarefa.dart';
import 'item_tarefa.dart';
import 'tarefa.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController tarefaController = TextEditingController();

  List<Tarefa> tarefas = [];

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  @override
  void dispose() {
    tarefaController.dispose();
    super.dispose();
  }

  Future<void> salvarTarefas() async {
    final prefs = await SharedPreferences.getInstance();

    final lista = tarefas.map((tarefa) => tarefa.toJson()).toList();

    await prefs.setStringList('tarefas', lista);
  }

  Future<void> carregarTarefas() async {
    final prefs = await SharedPreferences.getInstance();

    final lista = prefs.getStringList('tarefas');

    if (lista != null) {
      setState(() {
        tarefas = lista.map((e) => Tarefa.fromJson(e)).toList();
      });
    }
  }

  Future<void> adicionarTarefa() async {
    if (tarefaController.text.trim().isEmpty) return;

    setState(() {
      tarefas.add(
        Tarefa(
          titulo: tarefaController.text.trim(),
        ),
      );

      tarefaController.clear();
    });

    await salvarTarefas();
  }

  Future<void> editarTarefa(int index) async {
    final controller = TextEditingController(
      text: tarefas[index].titulo,
    );

    await showDialog(
      context: context,
      builder: (contextDialog) {
        return AlertDialog(
          title: const Text("Editar tarefa"),
          content: TextField(
            controller: controller,
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () async {
                final texto = controller.text.trim();

                if (texto.isNotEmpty) {
                  setState(() {
                    tarefas[index].titulo = texto;
                  });

                  await salvarTarefas();
                }

                Navigator.pop(contextDialog);
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
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

                  onAlterar: (valor) async {
                    setState(() {
                      tarefas[index].concluida = valor;
                    });

                    await salvarTarefas();
                  },

                  onExcluir: () async {
                    setState(() {
                      tarefas.removeAt(index);
                    });

                    await salvarTarefas();
                  },

                  onEditar: () async {
                    await editarTarefa(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}