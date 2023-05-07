import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../config/custom_colors.dart';

import '../base/base_screen.dart';

import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  //const SignInScreen({super.key});
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Aqui pegamos algumas propriedades da nossa tela entre ela o tamanho
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        //Aqui usamos o SizedBox para permitir a tela com scroll
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              // sempre usa-lo antes de um Container
              Expanded(
                child: Column(
                  // deixando o eixo vertical fique centralizado
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nome do app
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Green',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'grocer',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Aqui adicionamos a lista de textos animados
                    SizedBox(
                      height: 30,
                      // DefaultTextStyle com ele um TextStyle para todos os texts FadeAnimatedText
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          //animação em loop repeatForever:true
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticíneos'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Formulário
              Container(
                  // usamos os symmetric para poder dar um espaçamento tanto vertical como tbm horizontal
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
                    // adicionamos  const pq o constructor do CustomTextField é const
                    children: [
                      // Campo Email
                      const CustomTextField(
                        icon: Icons.email,
                        label: 'Email',
                      ),
                      // Campo Senha
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha',
                        isSecret: true,
                      ),
                      // Nosso botão de entrar
                      // SizedBox para definir altura e largura
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          // Estilização do botão ElevatedButton
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (c) {
                              return const BaseScreen();
                            }));
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      // Estrutura do "esqueceu a senha"
                      // Alinhar o texto do botão a direita
                      Align(
                        alignment: Alignment.centerRight,
                        // Aqui temos o nosso botão esqueceu senha
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ),
                          ),
                        ),
                      ),
                      // Divisor
                      // Usamos o Row para colocar um elemeto ao lado do outro
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              // divisor das widgets
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                // thickness é a espessura do divisor (da linha)
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Ou  '),
                            ),
                            Expanded(
                              // divisor das widgets
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                // thickness é a espessura do divisor (da linha)
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Botão de novo usuário
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.green,
                            ),
                          ),
                          onPressed: () {
                            // Adicionar mais uma tela na pilha de screens
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (c) {
                                return SignUpScreen();
                              }),
                            );
                          },
                          child: const Text(
                            'Criar Contar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
