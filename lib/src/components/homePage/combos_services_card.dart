import 'package:flutter/material.dart';

import '../card/card_combos_services.dart';

class CombosServicesCard extends StatelessWidget {
  const CombosServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 245,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CardCombosServices(imagePath: 'images/painting_wall.jpg'),
              CardCombosServices(imagePath: 'images/carpenter_combo.jpg'),
              CardCombosServices(imagePath: 'images/pest_control.jpg'),
            ],
          ),
        ),
      ],
    );
  }
}
