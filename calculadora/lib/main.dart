import 'package:flutter/material.dart';
import 'valor.dart';

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

  String visor = '';
  void adicionarValor(String numero) {
    setState(() {
      visor += numero;
    });
  }

  void limparVisor() {
    setState(() {
      visor = '';
    });
  }

  void apagarUltimo() {
    if (visor.isNotEmpty) {
      setState(() {
        visor = visor.substring(0, visor.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Calculadora') , centerTitle: true,),
        body: Column(
          children: [ 
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.blue[200],
              child: Text(visor, textAlign: TextAlign.end , style: const TextStyle(fontSize: 40) ),
            ),
            Row(
              children: [
                Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    adicionarValor('7');
                  },
                  child: const Text('7'),
                ),
                ),
                Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    adicionarValor('8');
                  },
                  child: const Text('8'),
                ),
                ),
                Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    adicionarValor('9');
                  },
                  child: const Text('9'),
                ),
                ),
                Expanded(
                child:
                ElevatedButton(onPressed: () {operador = '*';
                numero1 = int.tryParse(visor);
                limparVisor();}, child: const Text('*')
                ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    adicionarValor('4');
                  },
                  child: const Text('4'),
                ),
                ),
                Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    adicionarValor('5');
                  },
                  child: const Text('5'),
                ),
                ),
                Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    adicionarValor('6');
                  },
                  child: const Text('6'),
                ),
                ),
                Expanded(
                child:
                ElevatedButton(onPressed: () {operador = '-';
                numero1 = int.tryParse(visor);
                limparVisor();}, child: const Text('-')
                ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    adicionarValor('1');
                  },
                  child: const Text('1'),
                ),
                ),
                Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    adicionarValor('2');
                  },
                  child: const Text('2'),
                ),
                ),
                Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    adicionarValor('3');
                  },
                  child: const Text('3'),
                ),
                ),
                Expanded(
                child:
                ElevatedButton(onPressed: () {
                operador = '+';
                numero1 = int.tryParse(visor);
                limparVisor();
                },
                 child: const Text('+')
                 ),
                 ),
              ],
            ),
            Row(
              children: [
                Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    adicionarValor('0');
                  },
                  child: const Text('0'),
                ),
                ),
                Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    limparVisor();
                  },
                  child: const Text("C"),
                ),
                ),
                Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    apagarUltimo();
                  },
                  child: const Text("⌫"),
                ),
                ),
                Expanded(
                child:
                ElevatedButton(onPressed: () {operador = '/';
                numero1 = int.tryParse(visor);
                limparVisor();}, child: const Text('/')
                ),
                ),                             
              ],
            ),
            Row(
              children: [
                Expanded(
                child:
                ElevatedButton(onPressed: () {
                  numero2 = int.tryParse(visor);
                  final calculadora = Calculadora(numero1!, numero2!);
                  num resultado = 0;
                  switch(operador){
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
                }, child: const Text('=')
                ),   
                ),                           
              ],
            ),
          ],
        ),
      ),
    );
  }
}
