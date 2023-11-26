import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/entity/professional_entity.dart';

class ProfessionalDetailsInfo extends StatelessWidget {
  const ProfessionalDetailsInfo({super.key, required this.professional});

  final ProfessionalEntity professional;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Column(
        children: [
          const Text(
            'Trabalhos',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          Text(
            '${professional.jobsPerformeds}',
            style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          )
        ],
      ),
      Column(
        children: [
          const Text(
            'Compartilhar',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      const Column(
        children: [
          Text(
            'Avaliações',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          Text(
            '4.5',
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          )
        ],
      ),
      Column(
        children: [
          const Text(
            'Salvar',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
    ]);
  }
}
