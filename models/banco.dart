
import 'dart:io';

import 'cuenta.dart';

class Banco {

  void programa(List<Cuenta> cuentas) {
    int opcion;
    do {
      menu();
      opcion = int.parse(stdin.readLineSync()!);

      ejecutarMenu(cuentas, opcion);

    } while(opcion != 5);
  }

  void menu() {
    print("\n1. Consultar saldos");
    print("2. Ingresar dinero");
    print("3. Retirar dinero");
    print("4. Actualizar saldo");
    print("5. Salir");
    stdout.write("Seleccione una opción: ");
  }

  void ejecutarMenu(List<Cuenta> cuentas, int opcion) {
    switch (opcion) {
      case 1:
        consultar(cuentas);
        break;
      case 2:
        ingresar(cuentas);
        break;
      case 3:
        retirar(cuentas);
        break;
      case 4:
        for (var cuenta in cuentas) {
          cuenta.actualizarSaldo();
        }
        print("Saldos actualizados.");
        break;
      case 5:
        print("Saliendo...");
        break;
      default:
        print("Opción no válida.");
    }
  }

  void consultar(List<Cuenta> cuentas) {
    stdout.write("Ingrese número de cuenta: ");
    int numCuentaConsultar = int.parse(stdin.readLineSync()!);
    bool existe = cuentas.any((cuenta) => cuenta.numeroCuenta == numCuentaConsultar);
    if (existe) {
      for (var cuenta in cuentas) {
        if (cuenta.numeroCuenta == numCuentaConsultar) {
          print(cuenta);
        }
      }
    } else print("No existe este número de cuenta");
  }

  void ingresar(List<Cuenta> cuentas) {
    stdout.write("Ingrese número de cuenta: ");
    int numCuentaIngresar = int.parse(stdin.readLineSync()!);
    bool existe = cuentas.any((cuenta) => cuenta.numeroCuenta == numCuentaIngresar);
    if (existe) {
      stdout.write("Cantidad a ingresar: ");
      double cantidadIngresar = double.parse(stdin.readLineSync()!);
      for (var cuenta in cuentas) {
        if (cuenta.numeroCuenta == numCuentaIngresar) {
          cuenta.ingresar(cantidadIngresar);
        };
      }
    } else print("No existe este número de cuenta");
  }

  void retirar(List<Cuenta> cuentas) {
    stdout.write("Ingrese número de cuenta: ");
    int numCuentaRetirar = int.parse(stdin.readLineSync()!);
    bool existe = cuentas.any((cuenta) => cuenta.numeroCuenta == numCuentaRetirar);
    if (existe) {
      stdout.write("Cantidad a retirar: ");
      double cantidadRetirar = double.parse(stdin.readLineSync()!);
      for (var cuenta in cuentas) {
        if (cuenta.numeroCuenta == numCuentaRetirar) {
          cuenta.retirar(cantidadRetirar);
        }
      }
    } else print("No existe este número de cuenta");
  }

}