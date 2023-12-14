import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/registry/registry_address.dart';

class RegistryAddressComponent extends StatelessWidget {
  const RegistryAddressComponent({
    super.key,
    required this.name,
    required this.email,
    required this.cpf,
    required this.senha,
  });

  final String name;
  final String email;
  final String cpf;
  final String senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 800,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.4),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    RegistryAddress(
                        name: name, cpf: cpf, email: email, senha: senha),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Já possui uma conta?",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/login');
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
