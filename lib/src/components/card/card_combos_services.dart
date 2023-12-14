import 'package:flutter/material.dart';

class CardCombosServices extends StatelessWidget {
  const CardCombosServices({Key? key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Adicione cantos arredondados
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(12.0), // Adicione cantos arredondados
        child: SizedBox(
          width: 330.0,
          height: 236.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit
                .cover, // Garante que a imagem cubra todo o espaço disponível
          ),
        ),
      ),
    );
  }
}
