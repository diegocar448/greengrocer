import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isObscure;

  const CustomTextField({
    Key? key,
    //Aqui passamos as propriedade como placeholder e icon
    required this.icon,
    required this.label,
    //por não ser nullable setamos esse bool como false
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //Email aqui vamos estilizar o campo
        Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        //aqui definimos se o texto inserido será visualizado ou não
        obscureText: isObscure,
        decoration: InputDecoration(
          //aqui adicinamos o Icone no InputDecoration
          prefixIcon: Icon(icon),
          //o nosso placeholder
          labelText: label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
