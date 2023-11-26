import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../entity/user_entity.dart';
import '../../service/user_service.dart';

class RegistryController {
  RegistryController(
      {required this.nameController,
      required this.emailController,
      required this.cpfController,
      required this.passwordController});

  final String nameController;
  final String emailController;
  final String cpfController;
  final String passwordController;

  final UserService userService = UserService();

  void registryUser(context) async {
    final name = nameController;
    final email = emailController;
    final password = passwordController;
    final cpf = cpfController;

    final UserEntity userEntity = UserEntity(
      name: name,
      email: email,
      password: password,
      cpf: cpf,
    );
    try {
      await userService.insertUser(userEntity);
      Fluttertoast.showToast(msg: "Cadastro realizado com sucesso!");
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      Fluttertoast.showToast(msg: "Falha no cadastro");
      print(e);
    }
  }
}
