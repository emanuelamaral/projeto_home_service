import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/login/login_forms.dart';

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
          LoginForm(),
        ],
      ),
    );
  }
}
