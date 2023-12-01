import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/entity/professional_entity.dart';

import '../../pages/professional/professional_choose.dart';

class ProfessionalBottomBar extends StatelessWidget {
  const ProfessionalBottomBar({super.key, required this.professional});

  final ProfessionalEntity professional;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(230, 255, 255, 255),
      surfaceTintColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 180,
            height: 70,
            decoration: BoxDecoration(
                border: Border.all(width: 1.5),
                borderRadius: BorderRadius.circular(45)),
            child: IconButton(
              icon: const Icon(
                Icons.chat,
                color: Colors.black87,
                size: 45,
              ),
              onPressed: () {},
            ),
          ),
          Container(
            width: 180,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Colors.black87,
            ),
            child: TextButton(
              child: const Text(
                'Escolher',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfessionalChoose(professional: professional),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
