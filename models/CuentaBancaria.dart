import 'cuenta.dart';

class CuentaBancaria extends Cuenta {

  CuentaBancaria(super.numeroCuenta, super.saldo, super.cliente);

  @override
  void actualizarSaldo() {
    // TODO: implement actualizarSaldo
  }

  @override
  void retirar(double cant) {
    if (saldo > 0) {
      saldo -= cant;
      print("Retiro completado.\n- Saldo restante: $saldo");
    } else print("No se puede retirar.");
  }



}