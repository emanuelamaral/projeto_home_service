import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/registry/registry_user.dart';

class RegistryUserComponent extends StatelessWidget {
  const RegistryUserComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 680,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.4),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              RegistryUser(),
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
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
