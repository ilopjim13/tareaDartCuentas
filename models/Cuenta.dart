import 'Persona.dart';

abstract class Cuenta {
  int _numeroCuenta;
  double _saldo;
  Persona _cliente;

  Cuenta(this._numeroCuenta, this._saldo, this._cliente);

  int get numeroCuenta => _numeroCuenta;
  set numeroCuenta(int saldo) => _numeroCuenta = numeroCuenta;
  double get saldo => _saldo;
  set saldo(double saldo) => _saldo = saldo;
  Persona get cliente => _cliente;
  set cliente(Persona saldo) => _cliente = cliente;

  /**
   * Ingresa una cantidad al saldo de la cuenta
   */
  void ingresar(double cant) {
    _saldo += cant;
    print("Ingreso completado.\n- Saldo actualizado: $saldo€");
  }

  /**
   * Retira una cantidad del saldo de la cuenta
   */
  void retirar(double cant);

  /**
   * Actualiza el saldo de la cuenta con el interés que tenga
   */
  void actualizarSaldo();

}