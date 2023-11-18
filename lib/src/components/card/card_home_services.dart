import 'package:flutter/material.dart';

class CardHomeService extends StatelessWidget {
  final IconData icon;
  final double radius;
  final String textIcon;

  const CardHomeService(
      {super.key,
      required this.icon,
      required this.radius,
      required this.textIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 8.0), // Ajuste conforme necessário
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            elevation: 3.0,
            child: SizedBox(
              width: 100.0, // Ajuste conforme necessário
              height: 100.0, // Ajuste conforme necessário
              child: Center(
                child: Icon(
                  icon,
                  size: 45.0, // Ajuste conforme necessário
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0), // Ajuste conforme necessário
          Text(
            textIcon,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w100,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
