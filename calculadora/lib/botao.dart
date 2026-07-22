import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  const Botao({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  final String texto;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Color cor = Colors.grey;
    if(texto == '+'|| texto == '-' || texto == '*' || texto == '/'){
          cor = Colors.orange;
        }else if(texto == 'C'){
          cor = Colors.red;
        }else if(texto == '='){
          cor = Colors.green;
        }else if(texto == '⌫'){
          cor = Colors.yellow;
        }else{
          cor = Colors.grey;
        }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            minimumSize: const Size(0, 70),
          ),
          child: Text(
            texto,
            style: const TextStyle(fontSize: 24 ,color: Colors.white),
          ),
        ),
        
      ),
    );
  }
}