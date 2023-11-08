import 'package:flutter/material.dart';

class SecondOnboardPage extends StatelessWidget {
  const SecondOnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 480,
          ),
          Text(
            "Você encontrará aqui.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(250, 157, 78, 221),
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Diversos serviços disponíveis para o seu lar',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black26,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }
}
