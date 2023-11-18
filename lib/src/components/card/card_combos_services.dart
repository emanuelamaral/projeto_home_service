import 'package:flutter/material.dart';

class CardCombosServices extends StatelessWidget {
  const CardCombosServices({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: SizedBox(
        width: 330.0,
        height: 236.0,
        child: Center(
          child: Image.asset(
            imagePath,
            width: 330.0,
            height: 350.0,
          ),
        ),
      ),
    );
  }
}
