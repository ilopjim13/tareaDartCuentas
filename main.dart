
import 'bancoManager/BancoManager.dart';
import 'models/CuentaAhorro.dart';
import 'models/CuentaBancaria.dart';
import 'models/CuentaCorriente.dart';
import 'models/Persona.dart';

void main() {
  // Creamos los clientes
  Persona cliente1 = Persona("Juan", "Pérez", "12345678A");
  Persona cliente2 = Persona("Ana", "Gómez", "11111111B");
  Persona cliente3 = Persona("Pepe", "López", "22334455C");

  // Creamos las cuentas
  CuentaAhorro cuentaAhorro = CuentaAhorro(1001, 30.0, cliente1, 2.0, 50);
  CuentaCorriente cuentaCorriente = CuentaCorriente(1002, 50.0, cliente2);
  CuentaBancaria cuentaBancaria = CuentaBancaria(1003, 500, cliente3);

  // Creamos el bancoManager
  BancoMananger banco = BancoMananger();

  // Añadimos las cuentas a la lista del banco
  banco.cuentas.add(cuentaAhorro);
  banco.cuentas.add(cuentaCorriente);
  banco.cuentas.add(cuentaBancaria);

  // Iniciamos el programa
  banco.programa();
}