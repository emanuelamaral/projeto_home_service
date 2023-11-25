import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/homePage/combos_services_card.dart';
import 'package:projeto_home_service/src/components/homePage/home_services_card_list.dart';
import 'package:projeto_home_service/src/components/homePage/popular_home_services_card.dart';
import 'package:projeto_home_service/src/components/textfield/search_services_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            SearchServiceTextField(),
            SizedBox(height: 20),
            CombosServicesCard(),
            SizedBox(height: 20),
            HomeServiceCardList(),
            SizedBox(height: 20),
            PopularHomeServicesCard(),
          ],
        ),
      ),
    );
  }
}
