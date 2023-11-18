import 'package:flutter/material.dart';

import '../card/card_home_services.dart';

class HomeServiceCardList extends StatelessWidget {
  const HomeServiceCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Serviços domésticos',
          style: TextStyle(
              fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 150.0, // Ajuste conforme necessário
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CardHomeService(
                icon: Icons.format_paint_outlined,
                radius: 50.0,
                textIcon: 'Pintura',
              ),
              CardHomeService(
                  icon: Icons.electrical_services_rounded,
                  radius: 50.0,
                  textIcon: 'Eletricista'),
              CardHomeService(
                icon: Icons.plumbing_outlined,
                radius: 50.0,
                textIcon: 'Encanador',
              ),
              CardHomeService(
                icon: Icons.cleaning_services,
                radius: 50.0,
                textIcon: 'Limpeza doméstica',
              ),
              CardHomeService(
                  icon: Icons.pest_control_rodent,
                  radius: 50.0,
                  textIcon: 'Controle de peste'),
              CardHomeService(
                  icon: Icons.carpenter_rounded,
                  radius: 50.0,
                  textIcon: 'Carpintaria'),
              CardHomeService(
                  icon: Icons.yard_outlined,
                  radius: 50.0,
                  textIcon: 'Jardineiro')
            ],
          ),
        ),
      ],
    );
  }
}
