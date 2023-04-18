import 'package:flutter/material.dart';

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
                  children: [
                    //Email
                    TextFormField(),
                    //Senha
                    TextFormField(),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
