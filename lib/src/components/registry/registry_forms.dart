import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../entity/user_entity.dart';
import '../../service/user_service.dart';
import '../label/label_component.dart';
import '../buttons/sign_button_component.dart';
import '../textfield/cpf_textfield_component.dart';
import '../textfield/textfield_component.dart';

class RegistryForms extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cpfController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassowrdController = TextEditingController();

  final UserService userService = UserService();

  RegistryForms({super.key});

  bool verifyPassword() {
    if (passwordController.text != confirmPassowrdController.text) {
      Fluttertoast.showToast(msg: "As senhas não condizem!");
      return false;
    }
    return true;
  }

  void registryUser(context) async {
    if (!verifyPassword()) {
      return;
    }

    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final cpf = cpfController.text;

    final UserEntity userEntity = UserEntity(
      name: name,
      email: email,
      password: password,
      cpf: cpf,
    );
    try {
      print('Entrou no try do cadastrar');
      await userService.insertUser(userEntity);
      Fluttertoast.showToast(msg: "Cadastro realizado com sucesso!");
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      Fluttertoast.showToast(msg: "Falha no cadastro");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(top: 10),
        child: LabelComponents(textLabel: 'Seu Nome'),
      ),
      TextFieldComponent(
          password: false,
          email: false,
          hintText: 'Jorginho Cleiton',
          textController: nameController),
      const LabelComponents(textLabel: 'Seu Email'),
      TextFieldComponent(
        password: false,
        email: true,
        hintText: 'mail@gmail.com',
        textController: emailController,
      ),
      const LabelComponents(textLabel: 'Seu CPF'),
      CpfTextFieldComponent(textController: cpfController),
      const LabelComponents(textLabel: 'Crie Uma Senha'),
      TextFieldComponent(
        password: true,
        email: false,
        hintText: '************',
        textController: passwordController,
      ),
      const LabelComponents(textLabel: 'Confirme sua Senha'),
      TextFieldComponent(
        password: true,
        email: false,
        hintText: '************',
        textController: confirmPassowrdController,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 18),
        child: SignButtonComponent(
            text: 'Cadastrar',
            login: false,
            onPressedCallback: () => registryUser(context)),
      ),
    ]);
  }
}
