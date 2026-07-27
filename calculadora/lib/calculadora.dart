/// Classe responsável por realizar os cálculos matemáticos.
class Calculadora {
  const Calculadora(this.numero1, this.numero2);

  // Primeiro número da operação.
  final int numero1;

  // Segundo número da operação.
  final int numero2;

  /// Retorna a soma dos dois números.
  int somar() {
    return numero1 + numero2;
  }

  /// Retorna a subtração dos dois números.
  int subtrair() {
    return numero1 - numero2;
  }

  /// Retorna a divisão dos dois números.
  double dividir() {
    return numero1 / numero2;
  }

  /// Retorna a multiplicação dos dois números.
  int multiplicar() {
    return numero1 * numero2;
  }
}