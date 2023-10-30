import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/checkbox_component.dart';
import 'package:projeto_home_service/src/pages/registry/registry_page.dart';

import 'label_component.dart';
import 'sign_button_component.dart';
import 'textfield_component.dart';

class LoginComponent extends StatelessWidget {
  const LoginComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bem vindo de volta',
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 420,
            width: 350,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.4),
                borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LabelComponents(textLabel: "Seu Email"),
                const TextFieldComponent(
                    password: false, email: true, hintText: "seu@email.com"),
                const LabelComponents(textLabel: "Sua Senha"),
                const TextFieldComponent(
                    password: true, email: false, hintText: "*******"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CheckBoxComponent(),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Esqueceu a senha?",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                const Center(
                    child: SignButtonComponent(
                  text: "Login",
                  login: true,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Não possui uma conta?",
                      style: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const RegistryPage()));
                        },
                        child: const Text(
                          "Cadastrar",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
