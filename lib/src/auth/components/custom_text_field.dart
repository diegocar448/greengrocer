import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;

  //como os atributos acima são final, então o nosso construtor será um const
  const CustomTextField({
    Key? key,
    //Aqui passamos as propriedade como placeholder e icon
    required this.icon,
    required this.label,
    this.isSecret = false,
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
        //aqui definimos se o texto inserido será visualizado ou não
        obscureText: isObscure,
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
