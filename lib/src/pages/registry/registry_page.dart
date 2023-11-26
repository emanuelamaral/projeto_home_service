import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/registry/registry_user_component.dart';

class RegistryPage extends StatelessWidget {
  const RegistryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cadastre-se',
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            RegistryUserComponent(),
          ],
        ),
      )),
    );
  }
}
