import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/homePage/combos_services_card.dart';
import 'package:projeto_home_service/src/components/homePage/home_services_card_list.dart';
import 'package:projeto_home_service/src/components/homePage/popular_home_services_card.dart';
import 'package:projeto_home_service/src/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Bem vindo de volta!',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  // fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              '${user.name}',
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const CombosServicesCard(),
            const SizedBox(height: 20),
            const HomeServiceCardList(),
            const SizedBox(height: 20),
            const PopularHomeServicesCard(),
          ],
        ),
      ),
    );
  }
}
