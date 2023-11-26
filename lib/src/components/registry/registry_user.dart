import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projeto_home_service/src/components/registry/registry_controller.dart';
import '../label/label_component.dart';
import '../buttons/sign_button_component.dart';
import '../textfield/cpf_textfield_component.dart';
import '../textfield/textfield_component.dart';

class RegistryUser extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cpfController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassowrdController = TextEditingController();

  // final UserService userService = UserService();

  RegistryUser({super.key});

  void verifyValues(context) {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        cpfController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPassowrdController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Você não informou todos os campos!");
      return;
    }

    if (passwordController.text != confirmPassowrdController.text) {
      Fluttertoast.showToast(msg: "As senhas não condizem!");
      return;
    }

    RegistryController registry = RegistryController(
        nameController: nameController.text,
        emailController: emailController.text,
        cpfController: cpfController.text,
        passwordController: passwordController.text);

    registry.registryUser(context);
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
            onPressedCallback: () => verifyValues(context)),
      ),
    ]);
  }
}
