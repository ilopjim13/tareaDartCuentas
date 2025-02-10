
import 'CuentaBancaria.dart';

class CuentaCorriente extends CuentaBancaria {

  double interes = 1.5;

  CuentaCorriente(super.numeroCuenta, super.saldo, super.cliente);

  @override
  void actualizarSaldo() {
    saldo += saldo * (interes / 100);
    print("Saldo actualizado con interés del 1.5%: $saldo");
  }

  @override
  String toString() {
    return "Cuenta Corriente de ${cliente.nombre}\n- Saldo: $saldo";
  }

}