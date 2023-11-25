import 'package:flutter/material.dart';

import '../../pages/professional/professional_page.dart';
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
            children: [
              CardHomeService(
                icon: Icons.format_paint_outlined,
                textIcon: 'Pintores',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ProfessionalPage(profession: 'painter'),
                    ),
                  );
                },
              ),
              CardHomeService(
                icon: Icons.electrical_services_rounded,
                textIcon: 'Eletricistas',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ProfessionalPage(profession: 'eletrician'),
                    ),
                  );
                },
              ),
              CardHomeService(
                icon: Icons.plumbing_outlined,
                textIcon: 'Encanadores',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ProfessionalPage(profession: 'plumber'),
                    ),
                  );
                },
              ),
              CardHomeService(
                icon: Icons.cleaning_services,
                textIcon: 'Limpeza doméstica',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ProfessionalPage(profession: 'home_cleaner'),
                    ),
                  );
                },
              ),
              CardHomeService(
                icon: Icons.pest_control_rodent,
                textIcon: 'Controle de peste',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ProfessionalPage(profession: 'pest_controller'),
                    ),
                  );
                },
              ),
              CardHomeService(
                icon: Icons.carpenter_rounded,
                textIcon: 'Carpinteiros',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ProfessionalPage(profession: 'carpenter'),
                    ),
                  );
                },
              ),
              CardHomeService(
                icon: Icons.yard_outlined,
                textIcon: 'Jardineiros',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ProfessionalPage(profession: 'gardener'),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
