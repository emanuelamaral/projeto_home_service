import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/entity/professional_entity.dart';

class ProfessionalChoose extends StatelessWidget {
  const ProfessionalChoose({super.key, required this.professional});

  final ProfessionalEntity professional;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book",
          style: TextStyle(fontFamily: "Poppins"),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            size: 400,
          ),
        ],
      ),
    );
  }
}
