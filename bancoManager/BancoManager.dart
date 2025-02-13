
import 'dart:io';

import '../models/Cuenta.dart';
import '../models/CuentaAhorro.dart';

/**
 * Clase BancoManager que contiene toda la lógica a la hora de hacer consultas a
 * un banco
 */
class BancoMananger {

  List<Cuenta> cuentas = []; // Lista con las cuentas del banco

  /**
   * Ejecuta un bucle con las opciones del programa
   */
  void programa() {
    int? opcion;
    do {
      menu(); // Presenta el menú
      opcion = pedirOpcion(); // Obtiene una opción

      ejecutarMenu(opcion); // Ejecuta la opción

    } while(opcion != 6);
  }

  /**
   * Pide una opción al usuario y devuelve una opción válida
   */
  int pedirOpcion(){
    int opcion;

    do { // Pide la opción y si no está dentro del rango de opciones vuelve a pedirlo
      stdout.write("Seleccione una opción: ");
      opcion = int.tryParse(stdin.readLineSync()!) ?? -1; // Pide un número si recibe un string se convierte en -1
      if (opcion < 1 || opcion > 6) print("ERROR - Ingrese una opción válida");
    } while(opcion < 1 || opcion > 6);

    return opcion;
  }

  /**
   * Muestra las opciones del menú
   */
  void menu() {
    print("\n1. Consultar saldos");
    print("2. Ingresar dinero");
    print("3. Retirar dinero");
    print("4. Actualizar saldo anual");
    print("5. Atualizar interes");
    print("6. Salir");
  }

  /**
   * Ejecuta el menú con la opción correspondiente llamando a su función
   */
  void ejecutarMenu(int opcion) {
    switch (opcion) {
      case 1:
        consultar();
        break;
      case 2:
        ingresar();
        break;
      case 3:
        retirar();
        break;
      case 4:
        actualizarSaldo();
        break;
      case 5:
        actualizarInteres();
        break;
      case 6:
        print("Saliendo...");
        break;
    }
  }

  /**
   * Pide el número de cuenta y devuelve el número si existe y null si no existe
   */
  int? pedirCuenta() {
    stdout.write("Ingrese número de cuenta: ");
    int numCuenta = int.tryParse(stdin.readLineSync()!) ?? -1; // Pide el número de cuenta. Si da un nulo se iguala la variable a -1
    bool existe = cuentas.any((cuenta) => cuenta.numeroCuenta == numCuenta); // Comprueba si existe en la lista o no
    if (existe) return numCuenta;
    else return null;
  }


  /**
   * Consulta para ver los datos de la cuenta
   */
  void consultar() {
    int? numCuenta = pedirCuenta(); // Obtiene el número de cuenta
    if (numCuenta != null) {
      for (var cuenta in cuentas) {
        if (cuenta.numeroCuenta == numCuenta) { // Busca la cuenta que es y la muestra
          print(cuenta);
        }
      }
    } else print("No existe este número de cuenta");
  }

  /**
   * Ingresa una cantidad a una cuenta
   */
  void ingresar() {
    int? numCuenta = pedirCuenta(); // Obtiene el número de cuenta
    if (numCuenta != null) {
      stdout.write("Cantidad a ingresar: ");
      double cantidadIngresar = double.tryParse(stdin.readLineSync()!) ?? 0.0; // ingresa la cantidad o 0.0 si es nulo
      for (var cuenta in cuentas) {
        if (cuenta.numeroCuenta == numCuenta) {
          cuenta.ingresar(cantidadIngresar); // Busca la cuenta y le ingresa el ingreso
        };
      }
    } else print("No existe este número de cuenta");
  }

  /**
   * Retira una cantidad de una cuenta elegida
   */
  void retirar() {
    int? numCuenta = pedirCuenta(); // Obtiene el número de cuenta
    if (numCuenta != null) {
      stdout.write("Cantidad a retirar: ");
      double cantidadRetirar = double.tryParse(stdin.readLineSync()!) ?? 0.0; // Ingresa la cantidad que se va a retirar o 0.0 si es nulo
      for (var cuenta in cuentas) {
        if (cuenta.numeroCuenta == numCuenta) {
          cuenta.retirar(cantidadRetirar); // Busca la cuenta y le retira la cantidad ingresada por el usuario
        }
      }
    } else print("No existe este número de cuenta");
  }

  /**
   * Actualiza el saldo con el interes de la cuenta
   */
  void actualizarSaldo() {
    int? numCuenta = pedirCuenta(); // Obtiene el número de cuenta
    if (numCuenta != null) {
      for (var cuenta in cuentas) {
        if (cuenta.numeroCuenta == numCuenta) {
          cuenta.actualizarSaldo(); // Busca la cuenta ingresada y actualiza su saldo con el interés correspondiente
        }
      }
    } else print("No existe este número de cuenta");
  }

  void actualizarInteres() {
    stdout.write("Ingrese número de cuenta: ");
    int numCuentaRetirar = int.tryParse(stdin.readLineSync()!) ?? -1; // Pide el número de la cuenta y devuelve -1 si es nulo
    var cuenta = cuentas.where((cuenta) => cuenta.numeroCuenta == numCuentaRetirar).firstOrNull; // Obtiene la cuenta que corresponde o null si no existe. Usamos esta forma porque necesitamos la cuenta para castearla.
    if (cuenta != null) {
      if (cuenta is CuentaAhorro) { // Comrpueba si cuenta es una cuenta de ahorros
        stdout.write("Ingrese el interés anual: ");
        double interesUpdate = double.tryParse(stdin.readLineSync()!) ?? cuenta.interes; // Pide el interes y devuelve el que tenía si es null
        if (interesUpdate < 0) { // Si el interés ingresado es negativo vuelve a poner el que tenía y muestar un mensaje de error
          interesUpdate = cuenta.interes;
          print("No se puede añadir un interés negativo");
        }
        cuenta.cambiarInteres(interesUpdate); // Actualiza el interés con el número ingresado
      } else print("Esta cuenta no es de ahorros");
    } else print("No existe este número de cuenta");
  }

}