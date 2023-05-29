import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages/common_widgets/app_name_widget.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';

import '../../config/custom_colors.dart';

import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  //const SignInScreen({super.key});
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

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
                    const AppNameWidget(
                      greenTitleColor: Colors.white,
                      textSize: 40,
                    ),
                    //Aqui adicionamos a lista de textos animados
                    SizedBox(
                      height: 30,
                      // Categorias
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
                  /** Form é necessário para a nossa validação */
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      // adicionamos  const pq o constructor do CustomTextField é const
                      children: [
                        // Campo Email
                        CustomTextField(
                          icon: Icons.email,
                          label: 'Email',
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Digite seu email!';
                            }

                            if (!email.isEmail) {
                              return 'Digite um email válido!';
                            }
                            return null;
                          },
                        ),
                        // Campo Senha
                        CustomTextField(
                          icon: Icons.lock,
                          label: 'Senha',
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Digite sua senha!';
                            }
                            if (password.length < 7) {
                              return 'Digite uma senha com pelo menos 7 caracteres.';
                            }

                            return null;
                          },
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
                              if (_formKey.currentState!.validate()) {
                                print('Todos os campos estão validos!');
                              } else {
                                print('Campos não validos!');
                              }

                              //Get.offNamed(PagesRoutes.baseRoute);
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
                              Get.toNamed(PagesRoutes.signUpRoute);
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
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
