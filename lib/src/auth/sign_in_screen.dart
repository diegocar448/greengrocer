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
                  //adicionamos  const pq o constructor do CustomTextField é const
                  children: const [
                    //Campo Email
                    CustomTextField(
                      icon: Icons.email,
                      label: 'Email',
                    ),
                    //Campo Senha
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isObscure: true,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
