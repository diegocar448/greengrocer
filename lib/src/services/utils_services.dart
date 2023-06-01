//import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {
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

  // apresentar o toast
  void showToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      //backgroundColor: isError ? Colors.red : Colors.white,
      webBgColor: isError ? '#FF0000' : '#FFFFFF',
      textColor: isError ? Colors.white : Colors.black,
      webPosition: 'center',
      fontSize: 14,
      // Adicione essa propriedade para exibir o botão de fechar no toast
      webShowClose: true,
    );
  }
}
