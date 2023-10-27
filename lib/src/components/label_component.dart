import 'package:flutter/material.dart';

class LabelComponents extends StatelessWidget {
  final String textLabel;

  const LabelComponents({required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        textLabel,
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'),
      ),
    );
  }
}
