import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/professional/professional_details_info.dart';
import '../../components/bar/professional_bottom_bar.dart';
import '../../entity/professional_entity.dart';

class ProfessionalDetailsPage extends StatelessWidget {
  const ProfessionalDetailsPage({super.key, required this.professional});

  final ProfessionalEntity professional;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Detalhes',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${professional.name}',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '${professional.description}',
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Color.fromARGB(255, 100, 96, 96),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 5,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.person,
                          size: 350,
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black12,
                            Colors.black26,
                            Colors.black38,
                            Colors.black45,
                            Colors.black54,
                            Colors.black87,
                            Color.fromARGB(227, 0, 0, 0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ProfessionalDetailsInfo(
                          professional: professional,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 200, // Ajuste conforme necessário
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Opiniões dos clientes',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount: professional.avaliations!.length,
                      itemBuilder: (context, index) {
                        return Text(
                          '${professional.avaliations![index]}',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ProfessionalBottomBar(professional: professional),
        ],
      ),
    );
  }
}
