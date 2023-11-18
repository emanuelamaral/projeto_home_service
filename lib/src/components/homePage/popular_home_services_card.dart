import 'package:flutter/material.dart';

import '../card/card_popular_home_services.dart';

class PopularHomeServicesCard extends StatelessWidget {
  const PopularHomeServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Serviços Populares',
          style: TextStyle(
              fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 180,
          // width: 150,
          child: ListView(scrollDirection: Axis.horizontal, children: const [
            CardPopularHomeServices(
              imagePath: 'images/home_cleaning_page.jpg',
            ),
            CardPopularHomeServices(
                imagePath: 'images/plumber_home_service.jpg'),
            CardPopularHomeServices(
                imagePath: 'images/painting_home_service.jpg')
          ]),
        ),
      ],
    );
  }
}
