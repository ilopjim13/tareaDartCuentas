import 'Persona.dart';

abstract class Cuenta {
  int _numeroCuenta; // Número de la cuenta
  double _saldo; // Saldo que va a tener
  Persona _cliente; // Cliente propietario de la cuenta

  Cuenta(this._numeroCuenta, this._saldo, this._cliente); // Constructor de la cuenta

  // Creamoslos getters
  double get saldo => _saldo;
  Persona get cliente => _cliente;
  int get numeroCuenta => _numeroCuenta;
  // Creamos los setters
  set saldo(double saldo) => _saldo = saldo;
  set cliente(Persona cliente) => _cliente = cliente;
  set numeroCuenta(int numeroCuenta) => _numeroCuenta = numeroCuenta;

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