import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;

class ProfileTab extends StatelessWidget {
  //const ProfileTab({super.key});
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil do usuário'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
              ),
            ),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          children: [
            // Email
            CustomTextField(
              readOnly: false,
              initialValue: app_data.user.email,
              icon: Icons.email,
              label: 'Email',
            ),

            // Nome
            CustomTextField(
              readOnly: false,
              initialValue: app_data.user.name,
              icon: Icons.person,
              label: 'Nome',
            ),
            // Celular
            CustomTextField(
              readOnly: false,
              initialValue: app_data.user.phone,
              icon: Icons.phone,
              label: 'Celular',
            ),

            // CPF
            CustomTextField(
              readOnly: true,
              initialValue: app_data.user.cpf,
              icon: Icons.file_copy,
              label: 'CPF',
              isSecret: true,
            ),

            // Botão para atualizar a senha
            SizedBox(
                height: 50,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.green,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Atualizar senha')))
          ],
        ));
  }
}
