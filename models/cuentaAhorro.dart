import 'CuentaBancaria.dart';
import 'persona.dart';

class CuentaAhorro extends CuentaBancaria {
  double interes;
  double saldoMinimo;

  CuentaAhorro(int super.numeroCuenta, double super.saldo, Persona super.cliente, this.interes, this.saldoMinimo);

  @override
  void actualizarSaldo() {
    saldo += saldo * (interes / 100);
    print("Saldo actualizado con interés variable: $saldo");
  }

  @override
  retirar(double cantidad) {
    if (saldo - cantidad >= saldoMinimo) {
      saldo -= cantidad;
      print("Retiro completado.\n- Saldo restante: $saldo");
    } else {
      print("No se puede retirar.\n- Saldo mínimo requerido: $saldoMinimo");
    }
  }

  void cambiarInteres(double nuevoInteres) {
    interes = nuevoInteres;
    print("Nuevo interés de la cuenta: \$interes%");
  }

  @override
  String toString() {
    return "Cuenta Ahorro de ${cliente.nombre} ${cliente.apellido}\n- Saldo: $saldo";
  }
}