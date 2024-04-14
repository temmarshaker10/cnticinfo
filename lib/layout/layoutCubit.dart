import 'package:cnticinfo/PL_page.dart';
import 'package:cnticinfo/home.dart';
import 'package:cnticinfo/layout/PS_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../SM_page.dart';
import 'layoutStates.dart';

class layoutCubit extends Cubit<layoutStates> {
  layoutCubit() : super(layoutInitialState());

  static layoutCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [home(), PL_page(), System_Machine(), PS_page()];

  int indexScreen = 0;

  void changeScreen(int index) {
    indexScreen = index;
    emit(layoutChangeScreenIndexState());
  }

  String? smResult = '0';

  void decimalToBinary(int decimal) {
    if (decimal == 0) {
      smResult = '0';
      emit(layoutSmChangeValueState());
    } else {
      String binary = '';
      while (decimal > 0) {
        binary = (decimal % 2).toString() + binary;
        decimal ~/= 2;
      }
      smResult = binary;
      emit(layoutSmChangeValueState());
    }
  }

  void decimalToHex(int decimal) {
    String hex = decimal.toRadixString(16).toUpperCase();
    smResult = hex;
    emit(layoutSmChangeValueState());
  }

  void decimalToOctal(int decimal) {
    String octal = decimal.toRadixString(8);
    smResult = octal;
    emit(layoutSmChangeValueState());
  }

  void binaryToDecimal(String binary) {
    int decimal = int.parse(binary, radix: 2);
    smResult = decimal.toString();
    print("*********************$smResult");
    emit(layoutSmChangeValueState());
  }

  void binaryToOctal(String binary) {
    int decimal = int.parse(binary, radix: 2); // Convert binary to decimal
    String octal = decimal.toRadixString(8); // Convert decimal to octal
    smResult = octal;
    emit(layoutSmChangeValueState());
  }

  void binaryToHex(String binary) {
    int decimal = int.parse(binary, radix: 2); // Convert binary to decimal
    String hex = decimal
        .toRadixString(16)
        .toUpperCase(); // Convert decimal to hexadecimal
    smResult = hex;
    emit(layoutSmChangeValueState());
  }

  void octalToBinary(String octal) {
    int decimal = int.parse(octal, radix: 8); // Convert octal to decimal
    String binary = decimal.toRadixString(2); // Convert decimal to binary
    smResult = binary;
    emit(layoutSmChangeValueState());
  }

  void octalToDecimal(String octal) {
    int decimal = int.parse(octal, radix: 8); // Convert octal to decimal
    smResult = decimal.toString();
    emit(layoutSmChangeValueState());
  }

  void octalToHex(String octal) {
    int decimal = int.parse(octal, radix: 8); // Convert octal to decimal
    String hex = decimal
        .toRadixString(16)
        .toUpperCase(); // Convert decimal to hexadecimal
    smResult = hex;
    emit(layoutSmChangeValueState());
  }

  void hexToBinary(String hex) {
    int decimal = int.parse(hex, radix: 16); // Convert hexadecimal to decimal
    String binary = decimal.toRadixString(2); // Convert decimal to binary
    smResult = binary;
    emit(layoutSmChangeValueState());
  }

  void hexToDecimal(String hex) {
    int decimal = int.parse(hex, radix: 16); // Convert hexadecimal to decimal
    smResult = decimal.toString();
    emit(layoutSmChangeValueState());
  }

  void hexToOctal(String hex) {
    int decimal = int.parse(hex, radix: 16); // Convert hexadecimal to decimal
    String octal = decimal.toRadixString(8); // Convert decimal to octal
    smResult = octal;
    emit(layoutSmChangeValueState());
  }

  void viderOutput() {
    smResult = '';
    emit(layoutSmChangeValueState());
  }
}
