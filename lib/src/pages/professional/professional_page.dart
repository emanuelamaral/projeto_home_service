import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/entity/professional_entity.dart';

import '../../components/card/card_professinals.dart';
import '../../service/professional_service.dart';

class ProfessionalPage extends StatefulWidget {
  const ProfessionalPage({Key? key, required this.profession})
      : super(key: key);

  final String profession;

  @override
  _ProfessionalPageState createState() => _ProfessionalPageState();
}

class _ProfessionalPageState extends State<ProfessionalPage> {
  late Future<List<ProfessionalEntity>> _professionalsFuture;

  @override
  void initState() {
    super.initState();
    _professionalsFuture =
        ProfessionalService().getProfessionalsByProfession(widget.profession);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profissionais',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Center(
          child: FutureBuilder<List<ProfessionalEntity>>(
            future: _professionalsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Exibindo um indicador de carregamento enquanto espera
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return CardProfessional(
                        professional: snapshot.data![index]);
                  },
                );
              } else {
                return const Text(
                  'Não há profissionais disponíveis.',
                  style: TextStyle(fontFamily: 'Poppins'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
