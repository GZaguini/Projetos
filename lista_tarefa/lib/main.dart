import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'campo_tarefa.dart';
import 'item_tarefa.dart';
import 'tarefa.dart';

void main() {
  runApp(const MyApp());
}

/// Widget principal da aplicação
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Lista que armazena todas as tarefas
  List<Tarefa> tarefas = [];

  // Controller responsável pelo campo de texto
  final TextEditingController tarefaController = TextEditingController();

  /// Executado quando a tela é criada
  /// Carrega as tarefas salvas no celular
  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  /// Libera a memória do controller quando o widget é destruído
  @override
  void dispose() {
    tarefaController.dispose();
    super.dispose();
  }

  /// Salva todas as tarefas no SharedPreferences
  Future<void> salvarTarefas() async {
    final prefs = await SharedPreferences.getInstance();

    // Converte cada tarefa em JSON
    List<String> lista =
        tarefas.map((tarefa) => tarefa.toJson()).toList();

    // Salva a lista no celular
    await prefs.setStringList('tarefas', lista);
  }

  /// Carrega as tarefas salvas no celular
  Future<void> carregarTarefas() async {
    final prefs = await SharedPreferences.getInstance();

    // Recupera a lista salva
    final lista = prefs.getStringList('tarefas');

    if (lista != null) {
      setState(() {
        // Converte cada JSON novamente para um objeto Tarefa
        tarefas = lista
            .map((item) => Tarefa.fromJson(item))
            .toList();
      });
    }
  }

  /// Adiciona uma nova tarefa
  void adicionarTarefa() {
    // Não permite adicionar tarefa vazia
    if (tarefaController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      tarefas.add(
        Tarefa(
          titulo: tarefaController.text,
        ),
      );

      // Limpa o campo de texto
      tarefaController.clear();
    });

    // Salva a nova lista
    salvarTarefas();
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
            // Campo para adicionar uma nova tarefa
            CampoTarefa(
              controller: tarefaController,
              onPressed: adicionarTarefa,
            ),

            // Lista de tarefas
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,

                itemBuilder: (context, index) {
                  return ItemTarefa(
                    // Tarefa da posição atual
                    tarefa: tarefas[index],

                    // Marca ou desmarca a tarefa
                    onAlterar: (valor) {
                      setState(() {
                        tarefas[index].concluida = valor;
                      });

                      salvarTarefas();
                    },

                    // Remove a tarefa
                    onExcluir: () {
                      setState(() {
                        tarefas.removeAt(index);
                      });

                      salvarTarefas();
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