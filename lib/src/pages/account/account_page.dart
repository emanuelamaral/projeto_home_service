import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/buttons/update_button_component.dart';
import 'package:projeto_home_service/src/components/textfield/edit_profile_textfield.dart';
import 'package:projeto_home_service/src/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../controller/user_update.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController complementController = TextEditingController();

  void verifyValues(context, id) {
    if (nameController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        passwordController.text.isNotEmpty ||
        streetController.text.isNotEmpty ||
        numberController.text.isNotEmpty ||
        districtController.text.isNotEmpty ||
        cityController.text.isNotEmpty ||
        stateController.text.isNotEmpty ||
        complementController.text.isNotEmpty) {
      UserUpdate userUpdate = UserUpdate(
          id: id,
          nameController: nameController.text,
          emailController: emailController.text,
          passwordController: passwordController.text,
          streetController: streetController.text,
          numberController: numberController.text,
          districtController: districtController.text,
          cityController: cityController.text,
          stateController: stateController.text,
          complementController: complementController.text);

      userUpdate.updateUser(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edição de perfil',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(Icons.person, size: 200),
            Text(
              user.email!,
              style: TextStyle(fontFamily: 'Poppins'),
            ),
            EditProfileTextField(
              password: false,
              email: false,
              hintText: "Nome Completo",
              textController: nameController,
            ),
            EditProfileTextField(
              password: false,
              email: true,
              hintText: "Email",
              textController: emailController,
            ),
            EditProfileTextField(
              password: true,
              email: false,
              hintText: "*********",
              textController: passwordController,
            ),
            EditProfileTextField(
                password: false,
                email: false,
                hintText: "Rua/Logradouro",
                textController: streetController),
            EditProfileTextField(
                password: false,
                email: false,
                hintText: "Número",
                textController: numberController),
            EditProfileTextField(
                password: false,
                email: false,
                hintText: "Bairro",
                textController: districtController),
            EditProfileTextField(
                password: false,
                email: false,
                hintText: "Cidade",
                textController: cityController),
            EditProfileTextField(
                password: false,
                email: false,
                hintText: "Estado",
                textController: stateController),
            EditProfileTextField(
                password: false,
                email: false,
                hintText: "Complemento",
                textController: complementController),
            UpdateButtonComponent(
              text: "Atualizar",
              onPressedCallback: () => verifyValues(context, user.userId),
            ),
          ],
        ),
      ),
    );
  }
}
