import 'dart:convert';

class Tarefa {
  Tarefa({
    required this.titulo,
    this.concluida = false,
  });

  String titulo;
  bool concluida;

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'concluida': concluida,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      titulo: map['titulo'],
      concluida: map['concluida'],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Tarefa.fromJson(String source) =>
      Tarefa.fromMap(jsonDecode(source));
}