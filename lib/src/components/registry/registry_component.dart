import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/registry/registry_forms.dart';

import '../../pages/login/login_page.dart';

class RegistryComponent extends StatelessWidget {
  const RegistryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Cadastre-se',
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 680,
            width: 350,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.4),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                RegistryForms(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Já possui uma conta?",
                      style: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              //color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
