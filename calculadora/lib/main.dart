import 'package:flutter/material.dart';
import 'valor.dart';
import 'botao.dart';
import 'visor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? numero1;
  int? numero2;
  String? operador = '';
  String conta = '';

  String visor = '';
  void adicionarValor(String numero) {
    setState(() {
      visor += numero;
    });
  }

  void limparVisor() {
    setState(() {
      visor = '';
      conta = '';
    });
  }

  void apagarUltimo() {
  setState(() {
    if (visor.isNotEmpty) {
      visor = visor.substring(0, visor.length - 1);
    } else if (conta.isNotEmpty) {
      conta = conta.substring(0, conta.length - 1);
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Calculadora'), centerTitle: true),
        body: Column(
          children: [
            Visor(texto: visor, conta: conta),
            Row(
              children: [
                Botao(texto: '7', onPressed: () => adicionarValor('7')),
                Botao(texto: '8', onPressed: () => adicionarValor('8')),
                Botao(texto: '9', onPressed: () => adicionarValor('9')),
                Botao(
                  texto: '*',
                  onPressed: () {
                    setState(() {
                      operador = '*';
                      numero1 = int.tryParse(visor);
                      conta = visor + operador!;
                      visor = "";
                    });
                    // limparVisor();
                  },
                ),
              ],
            ),
            Row(
              children: [
                Botao(texto: '4', onPressed: () => adicionarValor('4')),
                Botao(texto: '5', onPressed: () => adicionarValor('5')),
                Botao(texto: '6', onPressed: () => adicionarValor('6')),
                Botao(
                  texto: '-',
                  onPressed: () {
                    setState(() {
                      operador = '-';
                      numero1 = int.tryParse(visor);
                      conta = visor + operador!;
                      visor = "";
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Botao(texto: '1', onPressed: () => adicionarValor('1')),
                Botao(texto: '2', onPressed: () => adicionarValor('2')),
                Botao(texto: '3', onPressed: () => adicionarValor('3')),
                Botao(
                  texto: "+",
                  onPressed: () {
                    setState(() {
                      operador = '+';
                      numero1 = int.tryParse(visor);
                      conta = visor + operador!;
                      visor = "";
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Botao(texto: '0', onPressed: () => adicionarValor('0')),
                Botao(
                  texto: "C",
                  onPressed: () {
                    limparVisor();
                  },
                ),

                Botao(
                  texto: "⌫",
                  onPressed: () {
                    apagarUltimo();
                  },
                ),

                Botao(
                  texto: "/",
                  onPressed: () {
                    setState(() {
                      operador = '/';
                      numero1 = int.tryParse(visor);
                      conta = visor + operador!;
                      visor = "";
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Botao(
                  texto: "=",
                  onPressed: () {
                    numero2 = int.tryParse(visor);
                    final calculadora = Calculadora(numero1!, numero2!);
                    num resultado = 0;
                    conta = conta + visor + "=";
                    switch (operador) {
                      case '+':
                        resultado = calculadora.somar();
                        break;
                      case '-':
                        resultado = calculadora.subtrair();
                        break;
                      case '*':
                        resultado = calculadora.multiplicar();
                        break;
                      case '/':
                        resultado = calculadora.dividir();
                        break;
                    }
                    setState(() {
                      visor = resultado.toString();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
