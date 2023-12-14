import 'package:flutter/material.dart';

import '../buttons/sign_button_component.dart';
import '../label/label_component.dart';
import '../textfield/textfield_component.dart';

class RegistryAddress extends StatelessWidget {
  RegistryAddress(
      {super.key,
      required this.name,
      required this.email,
      required this.cpf,
      required this.senha});

  final String name;
  final String email;
  final String cpf;
  final String senha;

  final streetController = TextEditingController();
  final numberOfHouseController = TextEditingController();
  final districtController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final complementController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(top: 10),
        child: LabelComponents(textLabel: 'Rua/Logradouro'),
      ),
      TextFieldComponent(
          password: false,
          email: false,
          hintText: 'Rua abc',
          textController: streetController),
      const LabelComponents(textLabel: 'Número da residência'),
      TextFieldComponent(
        password: false,
        email: false,
        hintText: '1234',
        textController: numberOfHouseController,
      ),
      const LabelComponents(textLabel: 'Bairro'),
      TextFieldComponent(
        password: false,
        email: false,
        hintText: 'Itaipu',
        textController: districtController,
      ),
      const LabelComponents(textLabel: 'Cidade'),
      TextFieldComponent(
        password: false,
        email: false,
        hintText: 'Medianeira',
        textController: cityController,
      ),
      const LabelComponents(textLabel: 'Estado'),
      TextFieldComponent(
        password: false,
        email: false,
        hintText: 'Paraná',
        textController: stateController,
      ),
      const LabelComponents(textLabel: 'Complemento'),
      TextFieldComponent(
        password: false,
        email: false,
        hintText: 'apto 001',
        textController: complementController,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 18),
        child: SignButtonComponent(
            text: 'Cadastrar', login: false, onPressedCallback: () {}),
      ),
    ]);
  }
}
