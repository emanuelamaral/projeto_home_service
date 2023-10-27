import 'package:flutter/material.dart';

import 'label_component.dart';
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LabelComponents(textLabel: "Seu Email"),
                TextFieldComponent(
                    password: false, email: true, hintText: "seu@email.com"),
                LabelComponents(textLabel: "Sua Senha"),
                TextFieldComponent(
                    password: true, email: false, hintText: "*******")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
