import 'package:flutter/material.dart';

import 'label_component.dart';
import 'sign_button_component.dart';
import 'textfield_component.dart';

class RegistryComponent extends StatelessWidget {
  const RegistryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Cadastre-se',
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 560,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.4),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: LabelComponents(textLabel: 'Seu Nome'),
              ),
              const TextFieldComponent(
                  password: false, email: false, hintText: 'Jorginho Cleiton'),
              const LabelComponents(textLabel: 'Seu Email'),
              const TextFieldComponent(
                  password: false, email: true, hintText: 'mail@gmail.com'),
              const LabelComponents(textLabel: 'Crie Uma Senha'),
              const TextFieldComponent(
                  password: true, email: false, hintText: '************'),
              const LabelComponents(textLabel: 'Confirme sua Senha'),
              const TextFieldComponent(
                  password: true, email: false, hintText: '************'),
              const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 18),
                child: SignButtonComponent(
                  text: 'Cadastrar',
                  login: false,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Já possui uma conta?",
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            //color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
