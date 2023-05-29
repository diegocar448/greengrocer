import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final List<TextInputFormatter>? phoneFormatters;
  final String? initialValue;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  //como os atributos acima são final, então o nosso construtor será um const
  const CustomTextField({
    Key? key,
    //Aqui passamos as propriedade como placeholder e icon
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.phoneFormatters,
    this.initialValue,
    this.readOnly = false,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  //aqui ele vai iniciar antes do build logo abaixo
  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return
        //Email aqui vamos estilizar o campo
        Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        /* Vai adicionar o texto no nosso campo de texto assim que for criado */
        initialValue: widget.initialValue,

        // aqui adicionamos a nossa mascara regex
        inputFormatters: widget.inputFormatters,
        //aqui definimos se o texto inserido será visualizado ou não
        obscureText: isObscure,
        /* Loca que fará a validação */
        validator: widget.validator,
        decoration: InputDecoration(
          //aqui adicinamos o Icone no InputDecoration
          prefixIcon: Icon(widget.icon),
          //funcionalidade para esconder ou mostrar caracteres
          //suffixIcon: widget.isSecret
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      //usamos o widget. para acessar a variavel da classe acima
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    //aqui temos a condicional para mudar o icone quando mudar o estado de isObscure
                    isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          //o nosso placeholder
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
