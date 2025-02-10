
import 'models/banco.dart';
import 'models/cuenta.dart';
import 'models/cuentaAhorro.dart';
import 'models/cuentaCorriente.dart';
import 'models/persona.dart';

void main() {
  List<Cuenta> cuentas = [];

  // Crear clientes
  Persona cliente1 = Persona("Juan", "Pérez", "12345678A");
  Persona cliente2 = Persona("Ana", "Gómez", "87654321B");

  // Crear cuentas
  CuentaAhorro cuentaAhorro = CuentaAhorro(1001, 0.0, cliente1, 2.0, 500);
  CuentaCorriente cuentaCorriente = CuentaCorriente(1002, 0.0, cliente2);

  cuentas.add(cuentaAhorro);
  cuentas.add(cuentaCorriente);

  Banco banco = Banco();

  banco.programa(cuentas);
}