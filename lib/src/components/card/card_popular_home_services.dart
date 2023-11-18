import 'package:flutter/material.dart';

class CardPopularHomeServices extends StatelessWidget {
  const CardPopularHomeServices({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: SizedBox(
        width: 130.0,
        height: 200.0,
        child: Center(
          child: Image.asset(
            imagePath,
            width: 150.0,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}
