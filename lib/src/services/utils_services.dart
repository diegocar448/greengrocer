//import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {
  // pacote parecido com o localStorage que temos na web
  final storage = const FlutterSecureStorage();
  // Salvar o dado localmente
  Future<void> saveLocalData(
      {required String key, required String data}) async {
    await storage.write(key: key, value: data);
  }

  // Recupera dado salvo localmente em segurança
  Future<String?> getLocalData({required String key}) async {
    return await storage.read(key: key);
  }

  // Remover dado salvo localmente
  Future<void> removeLocalData({required String key}) async {
    await storage.delete(key: key);
  }

  // R$ valor
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

// Formatar no data e retornar uma String
  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    /* adicionamos add_Hm para mostrar tbm a hora e os minutos */
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

  decodeQrCodeImage(String value) {
    String base64String = value.split(',').last;
    return base64.decode(base64String);
  }

  // apresentar o toast
  void showToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: isError ? Colors.red : Colors.white,
      //webBgColor: isError ? '#6A5ACD' : '#FFFFFF',
      textColor: isError ? Colors.white : Colors.black,
      webPosition: 'center',
      fontSize: 14,
      // Adicione essa propriedade para exibir o botão de fechar no toast
      webShowClose: true,
    );
  }
}
