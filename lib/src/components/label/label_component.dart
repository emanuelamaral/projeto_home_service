import 'package:flutter/material.dart';

class LabelComponents extends StatelessWidget {
  const LabelComponents({super.key, required this.textLabel, this.size});

  final String textLabel;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        textLabel,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: size),
      ),
    );
  }
}
