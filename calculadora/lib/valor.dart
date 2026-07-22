class Calculadora{
  Calculadora(this.numero1, this.numero2);

  final int numero1;
  final int numero2;

  int somar() {
    return numero1 + numero2;
  }

  int subtrair() {
    return numero1 - numero2;
  }
  double dividir() {
    return numero1 / numero2;
  }
  int multiplicar() {
    return numero1 * numero2;
  }
}