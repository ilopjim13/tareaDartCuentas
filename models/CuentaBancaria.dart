import 'Cuenta.dart';

/**
 * Cuenta Bancaria que hereda de la clase abstracta Cuenta que cuenta con todos
 * los métodos
 */
class CuentaBancaria extends Cuenta {

  CuentaBancaria(super.numeroCuenta, super.saldo, super.cliente);

  @override
  void retirar(double cant) {
    if (saldo > 0) { // Si el saldo es mayor a 0 deja sacar dinero
      if (saldo - cant >= 0) { // Si la resta es mayor a 0 puede sacar dinero
        saldo -= cant; // Resta la cantidad al saldo
        print("Retiro completado.\n- Saldo restante: $saldo€");
      } else print("Cantidad restante insuficiente para retirar");
    } else print("No se puede retirar.");
  }

  @override
  void actualizarSaldo() {
    print("Esta cuenta no tiene intereses"); // No tiene intereses
  }

  @override
  String toString() {
    return "Cuenta Bancaria de ${cliente.nombre}\n- Saldo: $saldo€";
  }

}