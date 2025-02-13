
import 'CuentaBancaria.dart';

/**
 * Cuenta corriente con interés fijo que hereda de Cuenta Bancaria
 */
class CuentaCorriente extends CuentaBancaria {

  static const double interes = 1.5; // Interés fijo

  CuentaCorriente(super.numeroCuenta, super.saldo, super.cliente);

  @override
  void actualizarSaldo() {
    saldo += saldo * (interes / 100); // Actualiza el saldo con el interés fijo
    print("Saldo actualizado con interés del 1.5%: $saldo€");
  }

  @override
  String toString() {
    return "Cuenta Corriente de ${cliente.nombre}\n- Saldo: $saldo€";
  }

}