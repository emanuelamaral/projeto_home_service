import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/entity/professional_entity.dart';
import 'package:projeto_home_service/src/pages/professional/professional_details_page.dart';

class CardProfessional extends StatelessWidget {
  const CardProfessional({Key? key, required this.professional})
      : super(key: key);

  final ProfessionalEntity professional;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),
      elevation: 5.0,
      child: SizedBox(
          // color: Color.fromARGB(255, 255, 255, 255),
          width: 350.0,
          height: 175.0,
          child: Row(
            children: [
              const Icon(
                Icons.person,
                size: 125,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${professional.name}',
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    '${professional.profession}',
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 125, top: 30, bottom: 10),
                    child: Text(
                      'R\$${professional.pricePerHour}/hr',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfessionalDetailsPage(
                                    professional: professional),
                              ),
                            );
                          },
                          child: const Text(
                            'Detalhes',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                        width: 120,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color.fromARGB(255, 49, 49, 49),
                        ),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Escolher',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  )
                  // Adicione outros widgets aqui para exibir outros dados do profissional
                ],
              ),
            ],
          )),
    );
  }
}
