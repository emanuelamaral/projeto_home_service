import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projeto_home_service/src/auth/user_auth.dart';
import 'package:projeto_home_service/src/service/user_service.dart';

import '../../pages/registry/registry_page.dart';
import '../buttons/sign_button_component.dart';
import '../checkbox/checkbox_component.dart';
import '../label/label_component.dart';
import '../textfield/textfield_component.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final UserService userService = UserService();

  void authUser(context) async {
    final email = emailController.text;
    final password = passwordController.text;

    final UserAuth userAuth = UserAuth(email: email, password: password);

    try {
      await userService.verifyAuthLogin(userAuth);
      Fluttertoast.showToast(msg: "Login realizado com sucesso!");
      Navigator.pushNamed(context, '/home_page');
    } catch (e) {
      Fluttertoast.showToast(msg: "Falha ao logar");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          TextFieldComponent(
              password: false,
              email: true,
              hintText: "seu@email.com",
              textController: emailController),
          const LabelComponents(textLabel: "Sua Senha"),
          TextFieldComponent(
            password: true,
            email: false,
            hintText: "*******",
            textController: passwordController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CheckBoxComponent(),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          Center(
              child: SignButtonComponent(
            text: "Login",
            login: true,
            onPressedCallback: () {
              authUser(context);
            },
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
                        fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
