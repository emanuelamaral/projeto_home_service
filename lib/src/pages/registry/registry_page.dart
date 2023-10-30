import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/registry_component.dart';

class RegistryPage extends StatelessWidget {
  const RegistryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: RegistryComponent()),
    );
  }
}
