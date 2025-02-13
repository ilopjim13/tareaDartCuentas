import 'CuentaBancaria.dart';
import 'Persona.dart';

/**
 * Cuenta de ahorro con interés variable y un saldo mínino que hereda de Cuenta Bancaria
 */
class CuentaAhorro extends CuentaBancaria {
  double interes; // Interés variable
  double saldoMinimo; // Saldo Mínimo

  CuentaAhorro(int super.numeroCuenta, double super.saldo, Persona super.cliente, this.interes, this.saldoMinimo);

  @override
  void actualizarSaldo() {
    saldo += saldo * (interes / 100); // Le suma el interés variable al saldo
    print("Saldo actualizado con interés del $interes%: $saldo€");
  }

  @override
  retirar(double cantidad) {
    if (saldo - cantidad >= saldoMinimo) { // Si la resta es menor al saldo Mínimo no dejará hacer la retirada
      saldo -= cantidad; // Le resta la cantidad al saldo
      print("Retiro completado.\n- Saldo restante: $saldo€");
    } else {
      print("No se puede retirar.\n- Saldo mínimo requerido: $saldoMinimo€");
    }
  }

  /**
   * Cambia el interes varible de la cuenta de ahorros
   */
  void cambiarInteres(double nuevoInteres) {
    interes = nuevoInteres; // Cambia el interés por el nuevo
    print("Nuevo interés de la cuenta: $interes%");
  }

  @override
  String toString() {
    return "Cuenta Ahorro de ${cliente.nombre} ${cliente.apellido}\n- Saldo: $saldo€\n- Interés: $interes%";
  }
}