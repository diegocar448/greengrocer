import 'package:flutter/material.dart';

import 'components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  //const SignInScreen({super.key});
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          //sempre usa-lo antes de um Container
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
                //usamos os symmetric para poder dar um espaçamento tanto vertical como tbm horizontal
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //adicionamos  const pq o constructor do CustomTextField é const
                  children: [
                    //Campo Email
                    const CustomTextField(
                      icon: Icons.email,
                      label: 'Email',
                    ),
                    //Campo Senha
                    const CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),
                    //SizedBox para definir altura e largura
                    SizedBox(
                      height: 50,
                      //Nosso botão
                      child: ElevatedButton(
                        //Estilização do botão ElevatedButton
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    //Estrutura do "esqueceu a senha"
                    //alinhar o texto do botão a direita
                    Align(
                      alignment: Alignment.centerRight,
                      //Aqui temos o nosso botão esqueceu senha
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
