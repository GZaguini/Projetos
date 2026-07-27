import 'package:flutter/material.dart';
import 'calculadora.dart';
import 'botao.dart';
import 'visor.dart';

void main() {
  runApp(const MyApp());
}

/// Widget principal da aplicação.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Primeiro número da operação.
  int? numero1;

  // Segundo número da operação.
  int? numero2;

  // Operador selecionado (+, -, *, /).
  String? operador = '';

  // Armazena a expressão da operação (ex.: 2+2=).
  String conta = '';

  // Número que está sendo digitado ou resultado da operação.
  String visor = '';

  /// Adiciona um número ao visor.
  void adicionarValor(String numero) {
    setState(() {
      visor += numero;
    });
  }

  /// Limpa todos os dados da calculadora.
  void limparVisor() {
    setState(() {
      visor = "";
      conta = "";
      numero1 = null;
      numero2 = null;
      operador = "";
    });
  }

  /// Remove o último caractere digitado.
  /// Caso o visor esteja vazio, remove o operador da operação.
  void apagarUltimo() {
    setState(() {
      if (visor.isNotEmpty) {
        visor = visor.substring(0, visor.length - 1);
      } else if (conta.isNotEmpty) {
        conta = "";
        visor = numero1.toString();
        operador = "";
      }
    });
  }

  /// Salva o primeiro número e o operador escolhido.
  void selecionarOperador(String op) {
    setState(() {
      operador = op;
      numero1 = int.tryParse(visor);
      conta = visor + op;
      visor = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        // Barra superior da aplicação.
        appBar: AppBar(
          title: const Text('Calculadora'),
          centerTitle: true,
        ),

        // Interface principal da calculadora.
        body: Column(
          children: [

            // Visor da calculadora.
            Visor(
              texto: visor,
              conta: conta,
            ),

            // Primeira linha de botões.
            Row(
              children: [
                Botao(texto: '7', onPressed: () => adicionarValor('7')),
                Botao(texto: '8', onPressed: () => adicionarValor('8')),
                Botao(texto: '9', onPressed: () => adicionarValor('9')),
                Botao(
                  texto: '*',
                  onPressed: () => selecionarOperador("*"),
                ),
              ],
            ),

            // Segunda linha de botões.
            Row(
              children: [
                Botao(texto: '4', onPressed: () => adicionarValor('4')),
                Botao(texto: '5', onPressed: () => adicionarValor('5')),
                Botao(texto: '6', onPressed: () => adicionarValor('6')),
                Botao(
                  texto: '-',
                  onPressed: () => selecionarOperador("-"),
                ),
              ],
            ),

            // Terceira linha de botões.
            Row(
              children: [
                Botao(texto: '1', onPressed: () => adicionarValor('1')),
                Botao(texto: '2', onPressed: () => adicionarValor('2')),
                Botao(texto: '3', onPressed: () => adicionarValor('3')),
                Botao(
                  texto: '+',
                  onPressed: () => selecionarOperador("+"),
                ),
              ],
            ),

            // Quarta linha de botões.
            Row(
              children: [
                Botao(texto: '0', onPressed: () => adicionarValor('0')),

                Botao(
                  texto: "C",
                  onPressed: limparVisor,
                ),

                Botao(
                  texto: "⌫",
                  onPressed: apagarUltimo,
                ),

                Botao(
                  texto: "/",
                  onPressed: () => selecionarOperador("/"),
                ),
              ],
            ),

            // Botão responsável por realizar o cálculo.
            Row(
              children: [
                Botao(
                  texto: "=",
                  onPressed: () {

                    // Obtém o segundo número digitado.
                    numero2 = int.tryParse(visor);

                    // Cria um objeto da classe Calculadora.
                    final calculadora = Calculadora(numero1!, numero2!);

                    num resultado = 0;

                    // Monta a expressão exibida no visor.
                    conta = conta + visor + "=";

                    // Executa a operação escolhida.
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

                    // Exibe o resultado da operação.
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