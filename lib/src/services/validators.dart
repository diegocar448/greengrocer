import 'package:get/get.dart';

// validacao Email
String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu email!';
  }

  if (!email.isEmail) {
    return 'Digite um email válido!';
  }
  return null;
}

//validacao Senha
String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua senha!';
  }
  if (password.length < 7) {
    return 'Digite uma senha com pelo menos 7 caracteres.';
  }

  return null;
}

//validacao Nome
String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite seu nome!';
  }
  final names = name.split(' ');

  //verifica se o usuario adicionou o nome completo
  if (names.length == 1) {
    return 'Digite seu nome completo.';
  }

  return null;
}

//validacao Celular
String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite um celular!';
  }

  if (phone.length < 14 || !phone.isPhoneNumber) {
    return 'Digite um telefone válido';
  }

  return null;
}

//validacao CPF
String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite um CPF!';
  }
  if (!cpf.isCpf) {
    return 'Digite um CPF válido';
  }

  return null;
}
